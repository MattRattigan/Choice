import 'package:flutter/material.dart';

class TitleText {
  final String? _title;
  final double? _size;
  String get titleText => _title!;
  double get titleSize => _size!;

  TitleText({String title = "Choice", double size = 69})
      : _title = title,
        _size = size;

  Text defaultTitle() {
    const TextAlign defaultAlign = TextAlign.center;

    return Text(
      titleText,
      style: TextStyle(
        fontSize: titleSize,
        color: Colors.white,
      ),
      textAlign: defaultAlign,
    );
  }
}
