import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Icon? _leading;
  final Icon? _trailing;
  final Color? _bgColor;

  const CustomAppBar({Icon? leading, Icon? trailing,Color? bgColor ,super.key})
      : _leading = leading,
        _trailing = trailing,
        _bgColor = bgColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: _bgColor ?? Colors.transparent,
      leading: _leading ?? const Icon(Icons.menu),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: _trailing ?? Icon(Icons.person)),
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight); // default AppBar height
}
