import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:no_name_app/widget/nav/navi.dart';



class SettingsScreen extends StatefulWidget {
  static const pfp1 = 'assets/images/pic.png';
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _dark;

  @override
  void initState() {
    super.initState();
    _dark = false;
  }

  Brightness _getBrightness() {
    return _dark ? Brightness.dark : Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: _getBrightness(),
      ),
      child: Scaffold(
        bottomNavigationBar: NaviBar(),
        backgroundColor: _dark ? null : Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          systemOverlayStyle:
              _dark ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
          iconTheme: IconThemeData(
              color: _dark
                  ? Colors.white
                  : Colors.black), // Changes color of top tool bar Icon
          backgroundColor: Colors
              .transparent, // Makes the uppertool bar transparent and invisible
          title: Text(
            "Settings",
            style: TextStyle(color: _dark ? Colors.white : Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(FontAwesomeIcons.moon),
              // This triggers the light and dark mode (_dark) boolean and setState method
              onPressed: () => setState(
                () => _dark = !_dark,
              ),
            ),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.red,
                    child: ListTile(
                      // Creates the list tile
                      onTap: () {
                        // TODO: open edit profile
                      },
                      title: const Text(
                        'John Doe',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: _dark ? Colors.blueGrey: Colors.amberAccent,
                        backgroundImage: const AssetImage(
                            SettingsScreen.pfp1), // Creates a circular avatar image
                      ),
                      trailing: const Icon(
                        Icons.edit, // The pencil Icon
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          // is what starts before the tile the (lock) in this case
                          leading: const Icon(
                            Icons.lock_outline,
                            color: Colors.red,
                          ),
                          title: const Text('Change Password'),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            // TODO: open change location
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: const Icon(FontAwesomeIcons.language),
                          title: Text('Choose Language'),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            // TODO: open change location
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: const Icon(Icons.location_on),
                          title: Text("Change Location"),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            // TODO: open change location
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Notification Settings',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                  SwitchListTile(
                    // Is a tile that has a toggle switch
                    activeColor: Colors.red,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: const Text('Received Notifications'),
                    onChanged: (value) {},
                  ),
                  SwitchListTile(
                    // Is a tile that has a toggle switch
                    activeColor: Colors.red,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: const Text('Received Newsletter'),
                    onChanged: (value) {},
                  ),
                  SwitchListTile(
                    // Is a tile that has a toggle switch
                    activeColor: Colors.red,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: const Text('Received Offer Notifications'),
                    onChanged: (value) {},
                  ),
                  SwitchListTile(
                    // Is a tile that has a toggle switch
                    activeColor: Colors.red,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: const Text('Received App Updates'),
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -20,
              left: -20,
              child: Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.red, shape: BoxShape.circle),
              ),
            ),
            Positioned(
              bottom: 00,
              left: 00,
              child: IconButton(
                icon: const Icon(FontAwesomeIcons.powerOff),
                onPressed: () {
                  // TODO: Add Logout
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    // Provides the underlines within the listTiles
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}