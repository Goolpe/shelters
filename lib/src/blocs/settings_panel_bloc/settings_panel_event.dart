import 'package:equatable/equatable.dart';

abstract class SettingsPanelEvent extends Equatable{
  SettingsPanelEvent();

  @override
  List get props => [];
}

class SettingsPanelStarted extends SettingsPanelEvent{}

class SettingsPanelOpened extends SettingsPanelEvent{}