import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:no_name_app/routes/app_routing.gr.dart';
import 'package:no_name_app/widget/global/base.dart';
import 'package:no_name_app/widget/nav/navi.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui';

import 'package:no_name_app/components/side_menu.dart' as sideDrawer;

@RoutePage()
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
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

    return Scaffold(
      key: widget.scaffoldKey,
      bottomNavigationBar: NaviBar(),
      drawer: const Drawer(child: sideDrawer.Sidebar()),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0x44000000),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            widget.scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          _displayMap(),
          Center(
            child: ElevatedButton(
              child: const Text('Go to Login'),
              onPressed: () {
                AutoRouter.of(context).push(const LoginRoute());
              },
            ),
          )
        ],
      ),
    );
  }

  GoogleMap _displayMap() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: _center, zoom: 15.0),
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      zoomControlsEnabled: true,
      zoomGesturesEnabled: true,
      scrollGesturesEnabled: true,
      mapType: MapType.normal,
      onMapCreated: _onMapCreated,
    );
  }
}
