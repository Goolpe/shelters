import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shelters/shelf.dart';

class CustomTextFieldSh extends StatelessWidget {
  const CustomTextFieldSh({
    Key key, 
    @required this.focus,
    this.nextFocus,
    @required this.labelText,
    this.auth,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next
  }) : super(key:key);

  final FocusNode focus;
  final FocusNode nextFocus;
  final String labelText;
  final bool obscureText;
  final Function auth;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.white,
          primaryColorDark: Colors.white,
        ),
        child: TextFormField(
          textInputAction: textInputAction,
          focusNode: focus,
          onFieldSubmitted: (String term){
            if(nextFocus != null){
              focus.unfocus();
              FocusScope.of(context).requestFocus(nextFocus);
            } else{
              auth();
            }
          },
          style: TextStyle(color: Colors.white),
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            fillColor: Colors.white,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
            )
          ),
        ),
      )
    );
  }
}
