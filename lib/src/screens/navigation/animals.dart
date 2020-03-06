import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelters/shelf.dart';
import 'package:shimmer/shimmer.dart';

class AnimalsScreen extends StatelessWidget{
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimalsListModel>(
      builder: (context, AnimalsListModel state, _){
        print(state.loading);
        return RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () => _refresh(context),
          child: GridView.builder(
            padding: EdgeInsets.only(bottom: 20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: state.animals.isNotEmpty ? state.animals.length : 12,
            itemBuilder: (context, index){
              if(state.animals.isNotEmpty){
                return Avatar(
                  animal: state.animals[index]
                );
              }
              return Shimmer.fromColors(
                baseColor: Colors.grey[200],
                highlightColor: Colors.grey[300],
                child: Avatar(
                  animal: null,
                )
              );
            }
          )
        );
      }
    );
  }

  Future<Null> _refresh(context) {
    Provider.of<AnimalsListModel>(context, listen: false).getData();
    return Future.delayed(Duration(seconds: 1));
  }
}