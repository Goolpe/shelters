import 'package:flutter/material.dart';
import 'package:shelters/shelf.dart';
import 'package:shimmer/shimmer.dart';

class AnimalsGridView extends StatelessWidget {
  AnimalsGridView({
    @required this.state
  });

  final AnimalsNotifier state;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(bottom: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: state.animals.isNotEmpty ? state.animals.length : 12,
      itemBuilder: (context, index){
        if(state.animals.isNotEmpty){
          return SheltersAvatar(
            animal: state.animals[index]
          );
        }
        return Shimmer.fromColors(
          baseColor: Colors.grey[200],
          highlightColor: Colors.grey[300],
          child: SheltersAvatar(
            animal: null,
          )
        );
      }
    );
  }
}