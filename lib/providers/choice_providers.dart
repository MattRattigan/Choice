import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_name_app/pages/home_screen.dart';
import 'package:no_name_app/user_model/users.dart';

// final idTokenProvider = Provider<String>((ref) => '');

final idTokenProvider = StateProvider<String>(
  (ref) => "",
);

final userClassProvider = StateProvider<ChoiceUser?> ((ref) => null); 

final tempProvider =  StateProvider<String?>((ref) => null);

final loginStatusProvider = StateProvider<LoginStatus>((ref) => LoginStatus.register);