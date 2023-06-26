
import 'package:flutter/material.dart';
import 'package:no_name_app/components/side_menu.dart';
import 'package:no_name_app/utils/rive_utils.dart';
import 'package:rive/rive.dart';

class ChoiceMenuIcon extends StatelessWidget {
  const ChoiceMenuIcon(
      {Key? key, required this.press, required this.riveOnInit})
      : super(key: key);

  final asset = 'assets/rive_assets/menu_button.riv';
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: RiveAnimation.asset(
        asset,
        onInit: riveOnInit,
      ),
    );
  }

  static Widget temp() {
    late SMIBool isSideBarClosed;
    return ChoiceMenuIcon(
      riveOnInit: (artboard) {
        StateMachineController controller = RiveUtils.getRiveController(
            artboard,
            stateMachineName: "State Machine");
        isSideBarClosed = controller.findSMI("isOpen") as SMIBool;
        isSideBarClosed.value = true;
      },
      press: () {
        isSideBarClosed.value = !isSideBarClosed.value;
      },
    );
  }

  Widget menuPostition(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          width: 288,
          height: MediaQuery.of(context).size.height,
          child: Sidebar(),
        ),
        Transform.translate(offset: Offset(288, 0),)
      ],
    );
  }
}

