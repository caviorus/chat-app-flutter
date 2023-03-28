import 'package:flutter/material.dart';

class ColorizedButton extends StatelessWidget {
  final String text;
  final Color color;
  final double height;
  final double width;
  final bool rounded;

  ColorizedButton({required this.text, required this.color, this.height = 0, this.width = 0,  this.rounded = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('clicked');
      },
      child: Ink(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Center(child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),)),
      ),
    );
  }
}
