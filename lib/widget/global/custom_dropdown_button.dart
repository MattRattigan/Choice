import 'package:flutter/material.dart';

class CustomDropDownButtonClass extends StatelessWidget {
  final List<String>? values;
  final double? width;

  const CustomDropDownButtonClass({super.key, required this.values, required this.width});

  @override
  Widget build(BuildContext context) {
    const TextStyle defaultTextStyle = TextStyle(color: Colors.white);

    BoxDecoration defaultDec = BoxDecoration(
      color: const Color.fromRGBO(53, 53, 53, 1.0),
      borderRadius: BorderRadius.circular(10),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width! * 0.05),
      width: width,
      decoration: defaultDec,
      child: buildDropdownButton(values!, (String? newValue) {}, defaultTextStyle),
    );
  }
}

DropdownButton<String> buildDropdownButton(List<String> values, Function(String?) onChanged, TextStyle defaultTextStyle) {
  return DropdownButton<String>(
    padding: const EdgeInsets.all(8.0),
    value: values.first,
    onChanged: onChanged,
    items: values.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    underline: Container(),
    dropdownColor: const Color.fromRGBO(53, 53, 53, 1.0),
    style: defaultTextStyle,
  );
}

