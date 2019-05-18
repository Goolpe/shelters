import 'package:flutter/material.dart';

class SearchSh extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Найти'
            ),
            textInputAction: TextInputAction.search,
          ),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: (){},
            )
          ],
        ),
        body: Center(
          child: Text(
            'Shelters',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      )
    );
  }
}