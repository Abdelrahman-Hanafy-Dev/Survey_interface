import 'package:equatable/equatable.dart';

abstract class DotEvent extends Equatable {
  const DotEvent();

  @override
  List<Object> get props => [];
}

class OptionClicked extends DotEvent {
  final int clickedOptionIndex;

  const OptionClicked({required this.clickedOptionIndex});

  @override
  List<Object> get props => [clickedOptionIndex];
}
