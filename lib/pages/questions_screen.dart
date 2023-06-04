import 'package:flutter/material.dart';
import 'package:no_name_app/widget/global/app_bar.dart';
import 'package:no_name_app/widget/global/buttons.dart';
import 'package:no_name_app/widget/nav/navi.dart';
import 'package:no_name_app/widget/global/custom_dropdown_button.dart';

class QuestionScreen extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;

  QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NaviBar navi = NaviBar();
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: navi.customGnav(context: context),
      appBar: AppBar(
        title: CustomAppBar(),
      ),
      body: SafeArea(
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _foodWidgetContainer(),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: _astroImageWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _astroImageWidget() {
    return Container(
      height: _deviceHeight * 0.50,
      width: _deviceWidth * 0.65,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/astro_moon.png"),
        ),
      ),
    );
  }

  Widget _foodWidgetContainer() {
    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      height: _deviceHeight * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _foodChoiceWidget(),
        ],
      ),
    );
  }

  Widget _foodChoiceWidget() {
    return CustomDropDownButtonClass(
      values: const [
        'Choose your favorite food from the options',
        'Latin',
        'American',
        'Italin'
      ],
      width: _deviceWidth,
    );
  }
}
