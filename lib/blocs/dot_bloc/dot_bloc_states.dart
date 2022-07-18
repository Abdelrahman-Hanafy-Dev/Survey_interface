import 'package:equatable/equatable.dart';

abstract class DotState extends Equatable {
  const DotState();

  @override
  List<Object> get props => [];
}

class ClickedLast extends DotState {
  final int selectedOptionIndex;

  const ClickedLast({required this.selectedOptionIndex});

  @override
  List<Object> get props => [selectedOptionIndex];
}
