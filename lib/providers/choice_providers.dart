import 'package:flutter_riverpod/flutter_riverpod.dart';

final idTokenProvider = Provider<String>((ref) => '');

final tempProvider =  StateProvider<String?>((ref) => null);
