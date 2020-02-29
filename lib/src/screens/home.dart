import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelters/shelf.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AnimalsBloc>(context).add(AnimalsFetch());

    return BlocBuilder(
      bloc: BlocProvider.of<AnimalsBloc>(context),
      builder: (context, AnimalsState state){
        if(state is AnimalsLoading  || state is AnimalsSuccess){
          return buildList(state);
        }
        return Container();
      }
    );
  }

  Widget buildList(AnimalsState state){
    return GridView.builder(
      padding: EdgeInsets.only(bottom: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: state is AnimalsSuccess ? state.data.list.length : 12,
      itemBuilder: (context, index){
        if(state is AnimalsSuccess){
          return Avatar(
            url: state.data.list[index].url,
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
}