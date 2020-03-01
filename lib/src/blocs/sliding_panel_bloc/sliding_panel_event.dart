import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SlidingPanelEvent extends Equatable{
  SlidingPanelEvent();

  @override
  List get props => [];
}

class SlidingPanelStarted extends SlidingPanelEvent{}

class SlidingPanelOpened extends SlidingPanelEvent{
  SlidingPanelOpened({
    @required this.url
  });
  
  final String url;

  @override
  List<Object> get props => [url];

  @override
  String toString() => 'SlidingPanelOpened: {url: $url}';
}