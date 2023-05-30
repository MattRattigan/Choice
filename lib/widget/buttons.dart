import 'package:no_name_app/widget/text.dart';
import 'package:flutter/material.dart';

class DeviceButton extends StatelessWidget {
  final String? _btnText;

  DeviceButton({String? btnText, Key? key})
      : _btnText = btnText,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // specify the width
      height: 40, // specify the height
      child: FloatingActionButton.extended(
        onPressed: () {},
        label: DeviceText(text: _btnText, fontWeight: FontWeight.bold,),
        backgroundColor: Colors.amber,
        icon: const Icon(
          Icons.touch_app,
          size: 16,
        ),
      ),
    );
  }
}
