import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rect_getter/rect_getter.dart';

import 'package:shelters/shelf.dart';

class LoginSh extends StatefulWidget{

  @override
  _LoginShState createState() => _LoginShState();
}

class _LoginShState extends State<LoginSh>{

  final Duration animationDuration = Duration(milliseconds: 300);
  final Duration delay = Duration(milliseconds: 300);
  GlobalKey rectLoginKey = RectGetter.createGlobalKey();
  Rect rect;  

  final FocusNode _loginFocus = FocusNode(); 
  final FocusNode _passFocus = FocusNode(); 

  @override
  Widget build(BuildContext context) {
    final LoginBloc _loginBloc = BlocProvider.of<LoginBloc>(context);

    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (BuildContext context, LoginState loginState) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Stack(
            children: <Widget>[
              Scaffold(
                body: Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.indigo[800],
                        Colors.indigo[700],
                        Colors.indigo[600],
                        Colors.indigo[400],
                      ],
                    ),
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.blue,
                            child: Icon(MdiIcons.paw, size: 50, color: Colors.white),
                          ),
                          CustomTextFieldSh(
                            focus: _loginFocus,
                            nextFocus: _passFocus,
                            labelText: 'Логин',
                          ),
                          CustomTextFieldSh(
                            focus: _passFocus,
                            auth: _onTap,
                            labelText: 'Пароль',
                            obscureText: true,
                            textInputAction: TextInputAction.done
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 30),
                            width: MediaQuery.of(context).size.width,
                            child: loginState is LoginLoading
                            ? RawMaterialButton(
                              shape: CircleBorder(),
                              fillColor: Colors.green,
                              elevation: 5,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                              onPressed: () => _onTap(_loginBloc),
                            )
                            :  RectGetter(           
                              key: rectLoginKey,                       
                              child: FloatingActionButton.extended(
                                heroTag: '#login',
                                elevation: 5,
                                backgroundColor: Colors.green,
                                icon: Icon(MdiIcons.paw, color: Colors.white),
                                label: Text('Войти', style: TextStyle(color: Colors.white)),
                                onPressed: () => _onTap(_loginBloc),
                              )
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: 0.8,
                                  color: Colors.black,
                                )
                              ),       
                              Text('   ИЛИ   ', style: TextStyle(color: Colors.white)),      
                              Expanded(
                                child: Container(
                                  height: 0.8,
                                  color: Colors.black,
                                )
                              ),
                            ]
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FlatButton.icon(
                                textColor: Colors.white,
                                icon: Icon(MdiIcons.vk, color: Colors.white),
                                label: Text('Вконтакте'),
                                onPressed: () => _onTap(_loginBloc),
                              ),
                              FlatButton.icon(
                                textColor: Colors.white,
                                icon: Icon(MdiIcons.facebook, color: Colors.white),
                                label: Text('Facebook'),
                                onPressed: () => _onTap(_loginBloc),
                              ),
                            ]
                          )
                        ],
                      )
                    )
                  ),
                )
              ),
              // _ripple(loginState),
            ]
          )
        );
      }
    );
  }

  void _onTap(LoginBloc _loginBloc) {
    FocusScope.of(context).requestFocus(FocusNode());
    _loginBloc.dispatch(
      LoginButtonPressed(
        username: '', 
        password: '',
        context: context
      )
    );
  }

  // Widget _ripple(LoginState _loginState) {

  //   rect = RectGetter.getRectFromKey(rectLoginKey);
  //   if (_loginState.toString() == 'LoginAuthenticated') {
  //     Future<dynamic>.delayed(animationDuration + delay,
  //     () {
  //       Navigator.of(context)
  //         .pushReplacement<dynamic, dynamic>(
  //           FadeRouteBuilder<dynamic>(page: NavigationSh()))
  //         .then((dynamic _) => setState(() => rect = null));
  //     }
  // );
  //     rect = rect.inflate(1.3 * MediaQuery.of(context).size.longestSide);

  //     return AnimatedPositioned(
  //       duration: animationDuration,
  //       left: rect.left,
  //       right: MediaQuery.of(context).size.width - rect.right,
  //       top: rect.top,
  //       bottom: MediaQuery.of(context).size.height - rect.bottom,
  //       child: Container(
  //         decoration: BoxDecoration(
  //           shape: BoxShape.circle,
  //           color: Colors.green,
  //         ),
  //       ),
  //     );
  //   }
  //   else{
  //     return Container();
  //   }
  // }
}