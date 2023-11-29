import 'package:flutter/material.dart';

import '../constants/consts.dart';

class BoxQuiz extends StatefulWidget {
  const BoxQuiz({super.key, required this.value, this.onChanged, required this.text});

  final bool value;
  final void Function(bool?)? onChanged;
  final String text;

  @override
  State<BoxQuiz> createState() => _BoxQuizState();
}

class _BoxQuizState extends State<BoxQuiz> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.3, // Adjust the scale factor to make the checkbox larger
          child:Checkbox(
            side: BorderSide(color: Colors.grey),
            value: widget.value,
            activeColor: ambercolor,
            onChanged: widget.onChanged,
              //   (value) {
              // setState(() {
              //   checkbox4 = value!;
              // });
            // },
          ),
        ),
        Text(widget.text),
      ],
    );
  }
}
