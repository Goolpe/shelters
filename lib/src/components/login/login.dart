import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shelters/src/widgets/widgets.dart';

class LoginSh extends StatelessWidget{

  final FocusNode _loginFocus = FocusNode(); 
  final FocusNode _passFocus = FocusNode(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GestureDetector(
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
              TextFormField(
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
              TextFormField(
                focusNode: _passFocus,
                onFieldSubmitted: (String term){
                  _passFocus.unfocus();
                  Navigator.pushReplacementNamed(context, '/home');
                },
                decoration: InputDecoration(
                  labelText: 'Пароль'
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                height: 40,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  child: Text('Войти'),
                  onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                )
              )
            ],
          )
        )
      )
    );
  }
}