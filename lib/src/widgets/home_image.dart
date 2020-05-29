import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class SheltersHomeImage extends StatelessWidget {
  SheltersHomeImage({
    @required this.id
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    final bool _orientationPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1552933529-e359b2477252?ixlib=rb-1.2.1&w=1000&q=80'),
                fit: BoxFit.cover
              )
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(bottom: 5, left: 10, right: 10),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black38,
                  ]
                )
              ),
              child: Text('Pushok', 
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white
                ),
              )
            )
          ),
        ],
      ),
      onTap: () => _orientationPortrait 
      ? Provider.of<PanelProvider>(context, listen: false).openPanel(id)
      : Provider.of<NavigationProvider>(context, listen: false).openAnimalScreen(id),
    );
  }
}