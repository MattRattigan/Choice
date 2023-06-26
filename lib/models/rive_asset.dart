import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(this.src,
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset("assets/rive_assets/icons.riv",
      artboard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "Chat"),
  RiveAsset("assets/rive_assets/icons.riv",
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search"),
  RiveAsset("assets/rive_assets/icons.riv",
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
      title: "Chat"),
  RiveAsset("assets/rive_assets/icons.riv",
      artboard: "BELL",
      stateMachineName: "BELL_Interactivity",
      title: "Notifications"),
  RiveAsset("assets/rive_assets/icons.riv",
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
      title: "Profile"),
];

var sideMenus = <RiveAsset>[
  RiveAsset(
    "assets/rive_assets/icons.riv",
    artboard: 'HOME',
    stateMachineName: "HOME_interactivity",
    title: "Home",
  ),
  RiveAsset("assets/rive_assets/icons.riv",
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search"),
  RiveAsset(
    "assets/rive_assets/icons.riv",
    artboard: 'LIKE/STAR',
    stateMachineName: "STAR_Interactivity",
    title: "Favorites",
  ),
  RiveAsset(
    "assets/rive_assets/icons.riv",
    artboard: 'CHAT',
    stateMachineName: "CHAT_Interactivity",
    title: "Help",
  ),
];

var sideMenu2 = <RiveAsset>[
  RiveAsset(
    "assets/rive_assets/icons.riv",
    artboard: 'TIMER',
    stateMachineName: "TIMER_Interactivity",
    title: "History",
  ),
    RiveAsset(
    "assets/rive_assets/icons.riv",
    artboard: 'BELL',
    stateMachineName: "BELL_Interactivity",
    title: "Notifications",
  ),
];
