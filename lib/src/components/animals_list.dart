import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelters/shelf.dart';
import 'package:shimmer/shimmer.dart';

class AnimalsList extends StatefulWidget {
  @override
  _AnimalsListState createState() => _AnimalsListState();
}

class _AnimalsListState extends State<AnimalsList> {

  @override
  void initState() {
    BlocProvider.of<AnimalsBloc>(context).add(AnimalsFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimalsBloc, AnimalsState>(
      bloc: BlocProvider.of<AnimalsBloc>(context),
      builder: (context, AnimalsState state){
        if(state is AnimalsLoading  || state is AnimalsSuccess){
          return _animalsList(state);
        }
        return Container();
      }
    );
  }

  Widget _animalsList(AnimalsState state){
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