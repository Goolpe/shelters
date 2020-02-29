import 'package:bloc/bloc.dart';
import 'package:shelters/shelf.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SettingsPanelBloc extends Bloc<SettingsPanelEvent, SettingsPanelState>{
  PanelController panelController;

  @override
  get initialState => SettingsPanelUninitial();

  @override
  Stream<SettingsPanelState> mapEventToState(event) async* {
    if(event is SettingsPanelStarted){
      yield* mapSettingsPanelStartedToState();
    } else if(event is SettingsPanelOpened){
      yield* mapSettingsPanelOpenedToState(event);
    }
  }

  Stream<SettingsPanelState> mapSettingsPanelStartedToState() async* {
    panelController = PanelController();
    yield SettingsPanelInitial(
      controller: panelController
    );
  }

  Stream<SettingsPanelState> mapSettingsPanelOpenedToState(event) async* {
    yield SettingsPanelInitial(
      controller: panelController
    );
    panelController.open();
  }
}