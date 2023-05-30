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

class DeviceText extends StatelessWidget {
  final String? _text;
  final String? _fontFamily;
  final double? _fontSize;
  final TextStyle? _textStyle;
  final TextAlign? _textAlign;
  final FontWeight? _fontWeight;
  final Color? _fontColor;

  const DeviceText({
    Key? key,
    String? fontFamily = "Roboto",
    double? fontSize = 16,
    TextStyle? textStyle,
    TextAlign? textAlign = TextAlign.center,
    FontWeight? fontWeight = FontWeight.normal,
    Color? fontColor = Colors.white,
    required String? text,
  })  : _fontFamily = fontFamily,
        _fontSize = fontSize,
        _textStyle = textStyle,
        _textAlign = textAlign,
        _text = text,
        _fontWeight = fontWeight,
        _fontColor = fontColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle deviceStyle = TextStyle(
        fontFamily: _fontFamily, fontSize: _fontSize, fontWeight: _fontWeight);
    return Text("$_text",
        style: deviceStyle, textAlign: _textAlign, softWrap: true);
  }
}
