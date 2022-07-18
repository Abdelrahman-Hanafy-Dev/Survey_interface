import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_interface/blocs/dot_bloc/dot_bloc.dart';
import 'package:survey_interface/blocs/dot_bloc/dot_bloc_events.dart';
import 'package:survey_interface/blocs/dot_bloc/dot_bloc_states.dart';
import 'package:survey_interface/blocs/survey_bloc/survey_bloc.dart';
import 'package:survey_interface/blocs/survey_bloc/survey_bloc_events.dart';

import 'components.dart';

class Page extends StatefulWidget {
  final int questionNumber;
  final String questionText;
  final List<String> questionAnswers;

  const Page({
    Key? key,
    required this.questionNumber,
    required this.questionText,
    required this.questionAnswers,
  }) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> with SingleTickerProviderStateMixin {
  late final List<GlobalKey<_ItemFaderState>> faderKeys;
  late final AnimationController _dotController;

  @override
  void initState() {
    super.initState();
    _dotController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    faderKeys = List.generate(5, (_) => GlobalKey<_ItemFaderState>());
    onInit();
  }

  void onInit() async {
    await Future.delayed(const Duration(milliseconds: 100));
    for (GlobalKey<_ItemFaderState> key in faderKeys) {
      await Future.delayed(const Duration(milliseconds: 40));
      key.currentState?.show();
    }
  }

  @override
  void dispose() {
    _dotController.dispose();
    super.dispose();
  }

  Future<void> animateDot(Offset startOffset) async {
    OverlayEntry entry = OverlayEntry(
      builder: (context) {
        double minTop = MediaQuery.of(context).padding.top + 80;
        return AnimatedBuilder(
          animation: _dotController,
          builder: (context, child) {
            return Positioned(
              top: minTop +
                  (startOffset.dy - minTop) * (1 - _dotController.value),
              left: 67.0,
              child: child!,
            );
          },
          child: const Dot(),
        );
      },
    );
    Overlay.of(context)?.insert(entry);
    await _dotController.forward(from: 0);
    entry.remove();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DotBloc, DotState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemFader(
              key: faderKeys[0],
              child: StepNumber(number: widget.questionNumber)),
          ItemFader(
              key: faderKeys[1],
              child: StepQuestion(question: widget.questionText)),
          const Spacer(),
          ...widget.questionAnswers.map(
            (answer) {
              int currentIndex = widget.questionAnswers.indexOf(answer);
              int keyIndex = currentIndex + 2;
              return ItemFader(
                key: faderKeys[keyIndex],
                child: OptionItem(
                  answer: answer,
                  onTap: (offset) {
                    onTapped(offset, keyIndex, context);
                  },
                  showDot:
                      (state as ClickedLast).selectedOptionIndex != keyIndex,
                ),
              );
            },
          ),
          const SizedBox(
            height: 80.0,
          ),
        ],
      );
    });
  }

  void onTapped(Offset offset, int index, BuildContext context) async {
    for (GlobalKey<_ItemFaderState> key in faderKeys) {
      await Future.delayed(const Duration(milliseconds: 40));
      key.currentState?.hide();
      if (index == faderKeys.indexOf(key)) {
        final dotBloc = BlocProvider.of<DotBloc>(context);
        dotBloc.add(OptionClicked(clickedOptionIndex: index));
        animateDot(offset).then((_) {
          dotBloc.add(const OptionClicked(clickedOptionIndex: -1));
          final questionBloc = BlocProvider.of<QuestionBloc>(context);
          questionBloc.add(QuestionAnswered());
        });
      }
    }
  }
}

class ItemFader extends StatefulWidget {
  final Widget child;

  const ItemFader({Key? key, required this.child}) : super(key: key);

  @override
  _ItemFaderState createState() => _ItemFaderState();
}

class _ItemFaderState extends State<ItemFader>
    with SingleTickerProviderStateMixin {
  int position = 1;
  late final AnimationController _controller;
  late final Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void show() {
    position = 1;
    _controller.forward();
  }

  void hide() {
    position = -1;
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 64 * position * (1 - _animation.value) as double),
          child: Opacity(
            opacity: _animation.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
