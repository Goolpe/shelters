import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_utils/keyboard_aware/keyboard_aware.dart';
import 'package:provider/provider.dart';
import 'package:shelters/shelf.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final _bottomOffset = mq.viewInsets.bottom + mq.padding.bottom;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      KeyboardAware(
                        builder: (context, keyboardConfig) {
                        final double _size = keyboardConfig.isKeyboardOpen ? 0 : 300;

                        return AnimatedContainer(
                            padding: EdgeInsets.only(left: 20),
                            curve: Curves.easeOutQuart,
                            width: _size,
                            height: _size,
                            duration: Duration(milliseconds: 100),
                            child: SvgPicture.asset(
                              'assets/logo.svg',
                              width: _size,
                              height: _size,
                            )
                          );
                        }
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Shelters', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      )
                    ],
                  )
                ),
                AnimatedContainer(
                  curve: Curves.easeOutQuart,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(bottom: _bottomOffset),
                  duration: Duration(milliseconds: 300),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: <Widget>[
                        SignInButton(
                          Buttons.Google,
                          text: "Continue with Google",
                          onPressed: () => Provider.of<AuthModel>(context, listen: false).handleSignIn(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('or'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Column(
                            children: <Widget>[
                              TextField(
                                textInputAction: TextInputAction.go,
                                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'Enter your email',
                                  border: UnderlineInputBorder(),
                                )
                              ),
                              TextField(
                                obscureText: true,
                                onEditingComplete: (){
                                  FocusScope.of(context).unfocus();
                                  _login();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: UnderlineInputBorder(),
                                )
                              ),
                            ],
                          )
                        ),
                        Container(
                          width: 200,
                          height: 50,
                          child: RaisedButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            textColor: Colors.white,
                            color: Color(0xffd63447),
                            child: Text('Login'),
                            onPressed: () => _login(),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        )
      ),
    );
  }
  _login(){

  }

}