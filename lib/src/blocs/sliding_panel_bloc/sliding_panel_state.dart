import 'package:equatable/equatable.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:meta/meta.dart';

abstract class SlidingPanelState extends Equatable{
  SlidingPanelState();

  @override
  List<Object> get props => [];
}

class SlidingPanelUninitial extends SlidingPanelState{}

class SlidingPanelInitial extends SlidingPanelState{
  SlidingPanelInitial({
    @required this.controller,
    @required this.url
  });

  final PanelController controller;
  final String url;

  @override
  List<Object> get props => [controller, url];

  @override
  String toString() => 'SlidingPanelInitial: {controller: $controller, url:$url}';
}