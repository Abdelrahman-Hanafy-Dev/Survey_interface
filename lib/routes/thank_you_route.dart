import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:survey_interface/constants.dart';

class ThanksPage extends StatefulWidget {
  const ThanksPage({Key? key}) : super(key: key);

  @override
  _ThanksPageState createState() => _ThanksPageState();
}

class _ThanksPageState extends State<ThanksPage> {
  final ConfettiController _confettiController = ConfettiController();

  @override
  void initState() {
    super.initState();
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: pageBackground,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 100,
              child: ConfettiWidget(
                confettiController: _confettiController,
                shouldLoop: true,
                blastDirectionality: BlastDirectionality.explosive,
              ),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Thank You.',
                  speed: const Duration(milliseconds: 300),
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 68,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
