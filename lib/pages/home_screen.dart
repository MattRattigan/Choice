import 'package:flutter/material.dart';
import 'package:no_name_app/widget/nav/navi.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:no_name_app/widget/home/featuredlistview.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double _deviceHeight, _deviceWidth;
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(25.7617, -80.1918);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    NaviBar navi = NaviBar();
    return Scaffold(
        bottomNavigationBar: navi.customGnav(context: context),
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            _displayMap(),
            homeSelection(),
          ],
        ));
  }

  GoogleMap _displayMap() {
    return GoogleMap(
        initialCameraPosition: CameraPosition(target: _center, zoom: 15.0));
  }

  Positioned homeSelection() {
    return Positioned(
      top: 0,
      child: Container(
        width: _deviceWidth,
        height: 100,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: const ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: HorizontalList(),
        ),
      ),
    );
  }
}
