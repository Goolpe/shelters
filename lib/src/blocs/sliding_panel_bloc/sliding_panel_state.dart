import 'package:equatable/equatable.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:meta/meta.dart';

abstract class SlidingPanelState extends Equatable{
  SlidingPanelState(this.url):super();
  final String url;

  @override
  List<String> get props => <String>[url];
}

class SlidingPanelUninitial extends SlidingPanelState{
  SlidingPanelUninitial():super('');
}

class SlidingPanelInitial extends SlidingPanelState{
  SlidingPanelInitial({
    @required this.controller,
    @required this.url
  }):super(url);

  final PanelController controller;
  final String url;
}