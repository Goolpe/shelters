import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shelters/src/components/home/article.dart';

class CustomListSh extends StatelessWidget {
  CustomListSh({
    Key key, 
    this.url,
  }) : super(key:key);

  final String url;
  final String text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae viverra purus, non iaculis neque. Nullam varius commodo semper. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc vehicula rutrum dolor at scelerisque. Donec lacinia nulla sapien, ac scelerisque ipsum bibendum semper. In sit amet tellus in nunc mollis posuere. Vestibulum nulla risus, placerat eu elementum vitae, volutpat non sem. In quis turpis finibus, viverra ante id, finibus dui. Pellentesque id fermentum sapien. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae';
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int i) {
        return Card(
          child: InkWell(
            child: Container(
              margin: EdgeInsets.only(left: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 80,
                    width: 80,
                    child: Image.network(
                      url
                    )
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(left: 15, top: 10, right: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            Text('#donor'),
                            Divider(),
                            Text(text,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                        ]
                      )
                    )
                  )
                ],
              ),
            ),
          onTap: () => Navigator.push<dynamic>(context, 
              CupertinoPageRoute<dynamic>(
                builder: (BuildContext context) => ArticleSh(url: url, text: text)
              )
            )
          )
        );
      },
    );
  }
}
