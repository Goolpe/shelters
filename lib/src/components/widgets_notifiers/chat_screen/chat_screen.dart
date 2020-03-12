import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Chat'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, int i){
                  return Container(
                    height: 100,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.black,
                      ),
                      title: Text('Sergey'),
                      subtitle: Text('Lorem Ipsum...'),
                      trailing: Text('20 jan'),
                    )
                  );
                },
              )
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(hintText: ''),
                    ),
                  ),
                  FlatButton(
                    color: Colors.blue,
                    child: Icon(MdiIcons.send, color: Colors.white),
                    onPressed: (){},
                  )
                ],
              ),
            )
          ],
        )
      )
    );
  }
}