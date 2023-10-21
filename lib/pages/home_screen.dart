import 'package:auto_route/auto_route.dart';


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_name_app/providers/choice_providers.dart';
import 'package:no_name_app/routes/app_routing.gr.dart';

import 'package:no_name_app/widget/nav/navi.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:no_name_app/components/side_menu.dart' as side_drawer;

enum LoginStatus {
  register('Register Now!'),
  signUp('Sign Up!'),
  loggedIn('');

  const LoginStatus(this.message);
  final String message;
}





@RoutePage()
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(
      key: widget.scaffoldKey,
      bottomNavigationBar: const NaviBar(),
      drawer: const Drawer(child: side_drawer.Sidebar()),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0x44000000),
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
          Consumer(
            builder: (context, ref, child) {
              final value = ref.watch(loginStatusProvider .notifier).state;
              switch (value) {
                case LoginStatus.loggedIn:
                  return const SizedBox.shrink();
                case LoginStatus.register:
                  return Center(
                    child: ElevatedButton(
                      child: Text(value.message),
                      onPressed: () {
                        AutoRouter.of(context).push(const RegisterRoute());
                      },
                    ),
                  );
                case LoginStatus.signUp:
                  return Center(
                    child: ElevatedButton(
                      child: Text(value.message),
                      onPressed: () {
                        AutoRouter.of(context).push(const LoginRoute());
                      },
                    ),
                  );
              }
            },
          ),
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
