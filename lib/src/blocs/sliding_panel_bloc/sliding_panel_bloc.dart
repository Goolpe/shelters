import 'package:bloc/bloc.dart';
import 'package:shelters/shelf.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingPanelBloc extends Bloc<SlidingPanelEvent, SlidingPanelState>{
  PanelController panelController;

  @override
  get initialState => SlidingPanelUninitial();

  @override
  Stream<SlidingPanelState> mapEventToState(event) async* {
    if(event is SlidingPanelStarted){
      yield* mapSlidingPanelStartedToState();
    } else if(event is SlidingPanelOpened){
      yield* mapSlidingPanelOpenedToState(event);
    }
  }

  Stream<SlidingPanelState> mapSlidingPanelStartedToState() async* {
    panelController = PanelController();
    yield SlidingPanelInitial(
      controller: panelController,
      url: ''
    );
  }

  Stream<SlidingPanelState> mapSlidingPanelOpenedToState(event) async* {
    yield SlidingPanelInitial(
      controller: panelController,
      url: event.url
    );
    panelController.open();
  }
}