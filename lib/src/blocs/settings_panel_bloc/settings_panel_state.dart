import 'package:equatable/equatable.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:meta/meta.dart';

abstract class SettingsPanelState extends Equatable{
  SettingsPanelState();

  @override
  List<String> get props => <String>[];
}

class SettingsPanelUninitial extends SettingsPanelState{}

class SettingsPanelInitial extends SettingsPanelState{
  SettingsPanelInitial({
    @required this.controller
  });

  final PanelController controller;
}