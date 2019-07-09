import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginSh extends StatefulWidget{

  @override
  _LoginShState createState() => _LoginShState();
}

class _LoginShState extends State<LoginSh>{

  final FocusNode _loginFocus = FocusNode(); 
  final FocusNode _passFocus = FocusNode(); 

  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    final double mqHeight = MediaQuery.of(context).size.height;
    final double mqWidth = MediaQuery.of(context).size.width;

    return Scaffold(
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Stack(
              children: <Widget>[
                Container(
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
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        decoration: InputDecoration(
                          labelText: 'Пароль'
                        ),
                      )
                    ),
                    // Container(
                    //   margin: EdgeInsets.symmetric(vertical: 30),
                    //   height: 40,
                    //   child: RaisedButton.icon(
                    //     color: Colors.green,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(20.0)
                    //     ),
                    //     icon: Icon(MdiIcons.paw, color: Colors.white),
                    //     label: Text('Войти', style: TextStyle(color: Colors.white)),
                    //     onPressed: (){
                    //       setState(() {
                    //         height = mqHeight;
                    //         width = mqWidth;
                    //       });
                    //       // Navigator.pushReplacementNamed(context, '/home');
                    //     },
                    //   )
                    // )
                  ],
                )
              ),
              Positioned(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  height: height,
                  width: width,
                  color: Colors.green
                )
              )
            ]
          )
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(MdiIcons.paw, color: Colors.white),
          label: Text('Войти', style: TextStyle(color: Colors.white)),
          onPressed: (){
            setState(() {
              height = mqHeight;
              width = mqWidth;
            });
            // Navigator.pushReplacementNamed(context, '/home');
          },
        )
    );
  }
}