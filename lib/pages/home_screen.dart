import 'package:flutter/material.dart';
import 'package:no_name_app/widget/nav/navi.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(25.1193, 53.3773);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 3), () {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => IntroScreen()));
    // });
  }

  @override
  Widget build(BuildContext context) {
    NaviBar navi = NaviBar();
    return Scaffold(
      bottomNavigationBar: navi.customGnav(),
      backgroundColor: Colors.white,
      body: _displayMap(),
    );
  }

  GoogleMap _displayMap() {
    return GoogleMap(
        initialCameraPosition: CameraPosition(target: _center, zoom: 11.0));
  }
}
