import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedGlassBox extends StatelessWidget {
  const FrostedGlassBox(
      {Key? key,
      required this.boxWidth,
      required this.boxHeight,
      required this.boxChild})
      : super(key: key);

  final double? boxWidth;
  final double? boxHeight;
  final boxChild;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: boxWidth,
        height: boxHeight,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4.0, // SigmaX = Horizontal Blur
                sigmaY: 4.0, // SigmaY = Vertical Blur
              ),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.white.withOpacity(0.15),
                    Colors.white.withOpacity(0.05),
                  ],
                ),
              ),
            ),
            Center(child: boxChild,)
          ],
        ),
      ),
    );
  }
}
