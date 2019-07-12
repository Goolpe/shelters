import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rect_getter/rect_getter.dart';

import 'package:shelters/shelf.dart';

class LoginSh extends StatefulWidget{

  @override
  _LoginShState createState() => _LoginShState();
}

class _LoginShState extends State<LoginSh>{
  final Duration animationDuration = Duration(milliseconds: 200);
  final Duration delay = Duration(milliseconds: 200);
  GlobalKey rectGetterKey = RectGetter.createGlobalKey();
  Rect rect;  

  final FocusNode _loginFocus = FocusNode(); 
  final FocusNode _passFocus = FocusNode(); 

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Scaffold(
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  child: Icon(MdiIcons.paw, size: 50, color: Colors.white),
                ),
                SizedBox(
                  height: 80,
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    focusNode: _loginFocus,
                    onFieldSubmitted: (String term){
                      _loginFocus.unfocus();
                      FocusScope.of(context).requestFocus(_passFocus);
                    },
                    decoration: InputDecoration(
                      labelText: 'Логин'
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: TextFormField(
                    focusNode: _passFocus,
                    onFieldSubmitted: (String term){
                      _passFocus.unfocus();
                      _onTap();
                    },
                    decoration: InputDecoration(
                      labelText: 'Пароль'
                    ),
                  )
                ),
              ],
            )
          )
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: RectGetter(           
          key: rectGetterKey,                       
          child: FloatingActionButton.extended(
            backgroundColor: Colors.green,
            icon: Icon(MdiIcons.paw, color: Colors.white),
            label: Text('Войти', style: TextStyle(color: Colors.white)),
            onPressed: _onTap,
          )
        )
      ),
      _ripple(),
      ]
    );
  }

  void _onTap() {
    setState(() => rect = RectGetter.getRectFromKey(rectGetterKey));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() =>
          rect = rect.inflate(1.3 * MediaQuery.of(context).size.longestSide));
      Future.delayed(animationDuration + delay, _goToNextPage);
    });
  }

  void _goToNextPage() {
    Navigator.of(context)
      .pushReplacement<dynamic, dynamic>(
        FadeRouteBuilder<dynamic>(page: NavigationSh()))
      .then((dynamic _) => setState(() => rect = null));
  }

  Widget _ripple() {
    if (rect == null) {
      return Container();
    }
    return AnimatedPositioned(
      duration: animationDuration,
      left: rect.left,
      right: MediaQuery.of(context).size.width - rect.right,
      top: rect.top,
      bottom: MediaQuery.of(context).size.height - rect.bottom,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
        ),
      ),
    );
  }
}