import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_interface/blocs/dot_bloc/dot_bloc_events.dart';
import 'package:survey_interface/blocs/dot_bloc/dot_bloc_states.dart';

class DotBloc extends Bloc<DotEvent, DotState> {
  DotBloc() : super(const ClickedLast(selectedOptionIndex: -1)) {
    on<OptionClicked>((event, emit) {
      if (state is ClickedLast) {
        int index = (event).clickedOptionIndex;
        emit(ClickedLast(selectedOptionIndex: index));
      }
    });
  }
}
