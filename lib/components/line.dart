import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 32.0 + 32 + 8,
      top: 75.0,
      bottom: 50.0,
      width: 1,
      child: Container(color: Colors.white.withOpacity(0.5)),
    );
  }
}
