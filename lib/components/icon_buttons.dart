import 'package:flutter/material.dart';

class IconButtons extends StatelessWidget {
  const IconButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 13.0,
      bottom: 30.0,
      child: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_upward,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_downward,
                color: Color(0xFF8C65C7),
                size: 30.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
