import 'package:flutter/material.dart';
import 'package:no_name_app/widget/global/base.dart';
import 'package:no_name_app/widget/nav/navi.dart';
import 'package:no_name_app/widget/global/custom_dropdown_button.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late double _deviceHeight, _deviceWidth;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return BasePage(bottomNavigationBar: NaviBar(), body: Container(
      color: Colors.white,
          height: _deviceHeight,
          width: _deviceWidth,
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: _astroImageWidget(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _foodWidgetContainer(),
                ],
              ),
            ],
          ),
        ),);
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
      padding: const EdgeInsets.only(top: 0.0),
      height: _deviceHeight * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _foodChoiceWidget(),
          _yesterdaysfoodChoiceWidget(),
          _allergyChoiceWidget()
        ],
      ),
    );
  }

  Widget _foodChoiceWidget() {
    return CustomDropDownButtonClass(
      values: const [
        'What is your favorite kind of food?',
        'Latin',
        'American',
        'Italin'
      ],
      width: _deviceWidth,
    );
  }

    Widget _allergyChoiceWidget() {
    return CustomDropDownButtonClass(
      values: const [
        'Do you have any allergies?',
        'Yes',
        'No',
      ],
      width: _deviceWidth,
    );
  }

    Widget _yesterdaysfoodChoiceWidget() {
    return CustomDropDownButtonClass(
      values: const [
        'What kind of food did you have yesterday?',
        'Latin',
        'American',
        'Italin'
      ],
      width: _deviceWidth,
    );
  }
}
