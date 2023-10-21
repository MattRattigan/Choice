import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:no_name_app/pages/home_screen.dart';
import 'package:no_name_app/providers/choice_providers.dart';
import 'package:no_name_app/routes/app_routing.gr.dart';
import 'package:no_name_app/user_storage/local_storage.dart';
import 'package:no_name_app/users_auth/validate_email.dart';
import 'package:no_name_app/users_auth/validate_pwd.dart';
import 'package:no_name_app/users_authenticate/user.register.dart';
import 'package:no_name_app/widget/global/frosted_glass.dart';
import 'package:no_name_app/users_auth/form_validation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:math' as math;
import 'dart:ui' as ui;

final textProvider = StateProvider<String>((ref) => '');

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

@RoutePage()
class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => RegisterPageState();
}

class RegisterPageState extends ConsumerState<RegisterScreen>
    with
        SingleTickerProviderStateMixin,
        FormHandler,
        ValidateEmail,
        ValidatePwd {
  AnimationController? _controller;
  final _userRegister = ChoiceRegister();
  final _storage = LocalStorage();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(seconds: 25),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final classRef = ref.watch(userClassProvider);
    final ctx = context;

    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          height: deviceHeight,
          width: deviceWidth,
          decoration: frostedBoxDecoration,
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _controller!,
                    builder: (BuildContext context, Widget? child) {
                      return ClipPath(
                        clipper: DrawClip(_controller!.value),
                        child: Container(
                          height: size.height * 0.2,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [Color(0xFFE0647B), Color(0xFFFCDD89)]),
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 60),
                    child: const Text(
                      '',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 46,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 65),
                  margin: const EdgeInsets.all(25.0),
                  child: FrostedGlass(
                    height: deviceHeight,
                    width: deviceWidth,
                    frostedChild: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          IconButton(
                              alignment: Alignment.bottomLeft,
                              onPressed: () => context.router.pop(),
                              icon: const Icon(Icons.arrow_back_ios_new)),
                          const Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: Icon(Icons.flutter_dash, size: 75),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Choice',
                            style: TextStyle(
                                fontSize: 40,
                                foreground: Paint()
                                  ..shader = ui.Gradient.linear(
                                    const Offset(0, 50),
                                    const Offset(130, 20),
                                    <Color>[
                                      Colors.amberAccent,
                                      Colors.deepOrange,
                                    ],
                                  )),
                          ),
                          Flexible(
                              child:
                                  createEmailTextField(validateEmailAddress)),
                          const SizedBox(height: 10),
                          Flexible(child: createPwdTextField(validatePassword)),
                          const SizedBox(height: 45),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                final handler = await handleRegister(
                                    _userRegister, formKey);
                                ref
                                    .read(userClassProvider.notifier)
                                    .update((state) => handler);

                                _storage.saveUser(handler!);

                                // Status of Login
                                ref.read(loginStatusProvider.notifier).state =
                                    LoginStatus.loggedIn;

                                // Push to da screen
                                if (mounted) {
                                  ctx.router.push(HomeRoute());
                                }
                              },
                              style: buttonStyle,
                              child: Text(
                                "Register",
                                textAlign: TextAlign.center,
                                style: textStyle,
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                  child: Divider(
                                indent: 10,
                                endIndent: 10,
                                thickness: 2,
                                color: Colors.amber,
                              )),
                              Text("OR"),
                              Flexible(
                                child: Divider(
                                  indent: 10,
                                  endIndent: 10,
                                  thickness: 2,
                                  color: Colors.amber,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.apple)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.chair))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

ButtonStyle buttonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
);

TextStyle textStyle = const TextStyle(
    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0);

class DrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  DrawClip(this.move);
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    double xCenter =
        size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
    double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);
    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
