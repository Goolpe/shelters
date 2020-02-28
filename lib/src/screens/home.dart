import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelters/shelf.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AnimalsBloc>(context).dispatch(AnimalsFetch());

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

  Widget buildLoading(){
    return GridView.builder(
      padding: EdgeInsets.only(bottom: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 12,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey[200],
        highlightColor: Colors.grey[300],
        enabled: false,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width/6,
                  backgroundColor: Colors.black,
                )
              ),
            ),
            Text('')
          ]
        )
      )
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