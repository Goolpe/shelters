import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

import 'package:shelters/index.dart';

class ArticlesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimalsProvider>(
      builder: (context, animalsState, snapshot) {
        return SheltersScaffold(
          appBar: const SheltersAppBar(
            leadingIcon: SheltersIcon.menu,
            title: 'Articles',
          ),
          body: ListView.builder(
            itemCount: 3,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder:(context, i){
              return GestureDetector(
                child:  Container(
                  height: 200,
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider('http://www.pethealthnetwork.com/sites/default/files/styles/large/public/hand-dog-article.png')
                          )
                        ),
                      ),
                      Expanded(
                        child: Material(
                          type: MaterialType.transparency,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(8),
                            child: const Text('Should my pet be tested for COVID-19?', style: TextStyle(fontSize: 20),),
                          )
                        )
                      )
                    ],
                  )
                ),
                onTap: () => Navigator.push(context, 
                  MaterialPageRoute(builder: (context) =>
                    ArticleScreen(
                      tag: 'tag_article_$i'
                    )
                  )
                ),
              );
            }
          )
        );
      }
    );
  }
}
