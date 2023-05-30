import 'package:flutter/material.dart';
import 'package:no_name_app/widget/buttons.dart';
import 'package:no_name_app/widget/nav/navi.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:no_name_app/widget/text.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NaviBar navi = NaviBar();
    return Scaffold(
      bottomNavigationBar: navi.customGnav(context: context),
      appBar: AppBar(
        title: const Text('Favorite Screen'),
      ),
      body: favoriteBox(
          "Hello World", "United States", 'assets/images/wheel.svg'),
    );
  }
}

Container favoriteBox(String title, String location, String locationString,
    {String select = "Select"}) {
  // var width = 500;
  SvgPicture locationPicture = SvgPicture.asset(
    locationString,
    width: 55,
    height: 68,
  );
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: Colors.white,
        width: 2.0,
      ),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        colors: [
          Colors.white.withOpacity(0.15),
          Colors.white.withOpacity(0.05)
        ],
      ),
    ),
    padding: const EdgeInsets.all(8.0),
    child: Container(
      child: Row(
        children: [
          locationPicture,
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: DeviceText(
                  text: title,
                  fontWeight: FontWeight.bold,
                  fontColor: Colors.black,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 12.0, top: 20.0, bottom: 6.0),
                    child: Icon(
                      Icons.add_location_alt_outlined,
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 12.0, top: 20.0, bottom: 6.0),
                    child: DeviceText(
                      text: location,
                      fontSize: 10,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 20.0, left: 20.0, bottom: 6.0),
                    child: DeviceButton(btnText: "Hello"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
