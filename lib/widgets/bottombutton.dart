import 'package:flutter/material.dart';

class BottomButton extends StatefulWidget {
  const BottomButton({super.key, required this.boolval, required this.buttontext, required this.ontap});

  final bool boolval;
  final String buttontext;
  final VoidCallback ontap;

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      //     () {
      //   setState(() {
      //     isPressed = !isPressed;
      //
      //   });
      // },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 50),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: widget.boolval
              ? LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey.shade900,
              Colors.black,
              Colors.black
            ],
          )
              : LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.black,
              Colors.grey.shade900
            ],
          ),
          boxShadow: widget.boolval
              ? [
            const BoxShadow(
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ]
              : [
            const BoxShadow(
              color: Colors.transparent,
            ),
          ],
        ),
        child:  Center(
          child: Text(
            widget.buttontext,
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
