import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedGlass extends StatelessWidget {
  final double? width;
  final double height;
  final Widget? frostedChild;

  const FrostedGlass({
    Key? key,
    required this.height,
    this.width,
    this.frostedChild,
  })  :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: height,
        width: width ?? deviceWidth,
        color: Colors.transparent, // ... make sure this is transparent
        child: Stack(
          children: [
            // blur effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(),
            ),
            // gradient effect
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white.withOpacity(0.13)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.15),
                    Colors.white.withOpacity(0.05),
                  ],
                ),
              ),
            ),
            // child
            Center(
              child: frostedChild,
            ),
          ],
        ),
      ),
    );
  }
}
