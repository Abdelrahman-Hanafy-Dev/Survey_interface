import 'package:flutter/material.dart';

class Plane extends StatelessWidget {
  const Plane({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      left: 35.0,
      top: 60.0,
      child: RotatedBox(
        quarterTurns: 2,
        child: Icon(
          Icons.airplanemode_active,
          color: Colors.white,
          size: 75.0,
        ),
      ),
    );
  }
}
