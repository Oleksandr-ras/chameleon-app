import 'package:color_changer/changing_screen_color.dart/bloc/colors_events.dart';
import 'package:color_changer/changing_screen_color.dart/bloc/colors_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsBloc extends Bloc<ColorsEvent, ColorsState> {
  ColorsBloc(ColorsState initialState) : super(InitialColorsState());

  @override
  Stream<ColorsState> mapEventToState(ColorsEvent event) async* {
    if(event is TapOnScreen) {
      try{

      yield ChangedColorsState(red: event.red, green: event.green, blue: event.blue);

      } catch (error) {

        yield ErrorColorState();
        
      }
    }
  }
}