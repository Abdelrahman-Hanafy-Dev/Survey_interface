import 'package:flutter/material.dart';

import 'dot.dart';

class OptionItem extends StatefulWidget {
  final String answer;
  final void Function(Offset dotOffset) onTap;
  final bool showDot;

  const OptionItem({
    Key? key,
    required this.answer,
    required this.onTap,
    required this.showDot,
  }) : super(key: key);

  @override
  _OptionItemState createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: InkWell(
        onTap: () {
          RenderBox? box = context.findRenderObject() as RenderBox?;
          Offset? position = box?.localToGlobal(Offset.zero);
          widget.onTap(position!);
        },
        child: Row(
          children: [
            const SizedBox(
              width: 22.0,
            ),
            Dot(
              visible: widget.showDot,
            ),
            const SizedBox(
              width: 25.0,
            ),
            Text(
              widget.answer,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
