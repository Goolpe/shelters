import 'package:equatable/equatable.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:meta/meta.dart';

abstract class SettingsPanelState extends Equatable{
  SettingsPanelState();

  @override
  List<Object> get props => [];
}

class SettingsPanelUninitial extends SettingsPanelState{}

class SettingsPanelInitial extends SettingsPanelState{
  SettingsPanelInitial({
    @required this.controller
  });

  final PanelController controller;

  @override
  List<Object> get props => [controller];

  @override
  String toString() => 'SettingsPanelInitial: {controller: $controller}';
}