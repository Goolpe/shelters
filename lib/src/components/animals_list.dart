import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelters/shelf.dart';
import 'package:shimmer/shimmer.dart';

class AnimalsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Consumer<AnimalsListModel>(
      builder: (context, state, _){
        if(state.animals.isEmpty){
          Provider.of<AnimalsListModel>(context, listen: false).fetchData();
        }
        return GridView.builder(
          padding: EdgeInsets.only(bottom: 20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: state.animals.isNotEmpty ? state.animals.length : 12,
          itemBuilder: (context, index){
            if(state.animals.isNotEmpty){
              return Avatar(
                url: state.animals[index].url,
                title: 'Teodor',
              );
            }
            return Shimmer.fromColors(
              baseColor: Colors.grey[200],
              highlightColor: Colors.grey[300],
              child: Avatar(
                url: '',
                title: '',
              )
            );
          }
        );
      }
    );
  }
}