import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:no_name_app/user_model/users.dart';
import 'package:no_name_app/users_auth/validate_email.dart';
import 'package:no_name_app/users_auth/validate_pwd.dart';
import 'package:no_name_app/users_authenticate/user.register.dart';
import 'package:no_name_app/users_authenticate/user_sign_in.dart';
import 'package:no_name_app/widget/global/frosted_glass.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:math' as math;
import 'dart:ui' as ui;

// import 'package:flutter_hooks/flutter_hooks.dart';

final textProvider = StateProvider<String>((ref) => '');


// class LoginScreen1 extends ConsumerStatefulWidget {
//   static const String imgBackground = 'assets/images/forest.jpg';
//   const LoginScreen1({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends ConsumerState<LoginScreen>
//     with ValidatePwd, ValidateEmail ,AppPressHandler {
//   final _userSignin = ChoiceSignIn();
//   @override
//   void initState() {
//     super.initState();
//     //  final textValue = ref.watch(textProvider);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: ConstrainedBox(
//           constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
//           child: Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(LoginScreen.imgBackground),
//                 fit: BoxFit.cover, // Goes on until it fits the entire background
//               ),
//             ),
//             // alignment: Alignment.bottomCenter,
//             child: Stack(
//               alignment: Alignment.center,
//               children: <Widget>[
//                 FrostedGlass(
//                   height: 600.00,
//                   width: MediaQuery.of(context).size.width,
//                 ),
//                 Center(
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Icon(
//                           Icons.flutter_dash,
//                           size: 100,
//                         ),
//                         const SizedBox(
//                           height: 75,
//                         ),
//                         const Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text('Login'),
//                             Text('|'),
//                             Text('Sign Up'),
//                           ],
//                         ),
//                         // TODO: Hello again!

//                         const Text(
//                           "Hello Again!",
//                           style: TextStyle(
//                             fontSize: 52,
//                             fontFamily: 'Satoshi',
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         const Text(
//                           'Welcome back you\'ve been missed',
//                           style: TextStyle(
//                             fontSize: 24,
//                           ),
//                         ),
//                         const SizedBox(height: 50),
//                         // TODO: email textfield
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.grey[200],
//                               border: Border.all(color: Colors.white),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 20.0),

//                                 child: TextFormField(
//                                   validator: (val) => validateEmailAddress(val),
//                                   controller: _emailController,
//                                   onChanged: (value) {},
//                                   decoration: const InputDecoration(
//                                     errorText: null,
//                                     border: InputBorder.none,
//                                     hintText: 'Email',
//                                   ),
//                                 ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         // TODO: Password TextField
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.grey[200],
//                               border: Border.all(color: Colors.white),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 20.0),
//                               child:
//                                 TextFormField(
//                                   validator: (val) => validatePassword(val),
//                                   controller: _pwdController,
//                                   onChanged: (value) {},
//                                   decoration: const InputDecoration(
//                                     border: InputBorder.none,
//                                     hintText: 'Password',
//                                     errorText: null
//                                   ),
//                                   obscureText: true,
//                                 ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         // TODO: sign button
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                           child: ElevatedButton(
//                             onPressed: () {
//                               handleSignIn(_userSignin);
//                             },
//                             style: ButtonStyle(
//                               backgroundColor:
//                                   MaterialStateProperty.all<Color>(Colors.amber),
//                               padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//                                   const EdgeInsets.all(20.0)),
//                               shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12))),
//                             ),
//                             child: const Center(
//                               child: Text(
//                                 // MaterialStateProperty<EdngeInsetsGeometry?>?
//                                 'Sign In', //EdgeInsets.all(20.0)
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18.0),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 25.0),
//                         // TODO: Not a member? register now
//                         const Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Not a Member? ',
//                               style: TextStyle(
//                                   fontSize: 18.0, fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               'Register Now',
//                               style: TextStyle(
//                                   color: Colors.amber,
//                                   fontWeight: FontWeight.w800,
//                                   fontSize: 18.0),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 25,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _pwdController.dispose();
//     super.dispose();
//   }
// }

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AnimationPageState();
}

class AnimationPageState extends ConsumerState<LoginScreen>
    with
        SingleTickerProviderStateMixin,
        FormHandler,
        ValidateEmail,
        ValidatePwd {
  AnimationController? _controller;
  final _userSignin = ChoiceSignIn();

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

    // final changeColor = ref.watch(registerOrSignInProvider);

    var size = MediaQuery.of(context).size;
    // if (_controller.value == 0.8) _controller.reverse();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // extendBodyBehindAppBar: true,
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
                          // height: size.height * 0.5,
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
                    frostedChild: createForm(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ButtonStyle buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  TextStyle textStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0);

  Widget createForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
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
          Flexible(child: createEmailTextField(validateEmailAddress)),
          const SizedBox(height: 10),
          Flexible(child: createPwdTextField(validatePassword)),
          const SizedBox(height: 45),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ElevatedButton(
              onPressed: () {
                handleSignIn(_userSignin);
              },
              style: buttonStyle,
              child: Text(
                "Sign In",
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
              IconButton(onPressed: () {}, icon: const Icon(Icons.apple)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.chair))
            ],
          )
        ],
      ),
    );
  }
}

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

//
// <T extends ConsumerStatefulWidget> on ConsumerState<T>
mixin FormHandler <T extends ConsumerStatefulWidget> on ConsumerState<T> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

    String? error;
  ChoiceUser? result;
  bool loading = false;

  BoxDecoration frostedBoxDecoration = const BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/bg_sign_login.jpg'),
      fit: BoxFit.cover,
    ),
  );

  InputDecoration frostedInputDecorationEmail(String? hintText) {
    return InputDecoration(
      icon: const Icon(
        Icons.email,
        size: 20,
      ),
      border: const UnderlineInputBorder(),
      hintText: hintText,
    );
  }

  Widget createEmailTextField(String? Function(String?) validateEmailOrPwd) {
    return TextFormField(
      validator: (val) => validateEmailOrPwd(val),
      controller: _emailController,
      onChanged: (value) {},
      decoration: frostedInputDecorationEmail("Email"),
    );
  }

  InputDecoration frostedInputDecorationPwd(String? hintText) {
    return InputDecoration(
      icon: const Icon(
        Icons.security_rounded,
        size: 20,
      ),
      border: const UnderlineInputBorder(),
      hintText: hintText,
    );
  }

  Widget createPwdTextField(String? Function(String?) validateEmailOrPwd) {
    return TextFormField(
      controller: _pwdController,
      validator: (val) => validateEmailOrPwd(val),
      onChanged: (value) {},
      decoration: frostedInputDecorationPwd("Password"),
      obscureText: true,
    );
  }

    Future<void> handleRegister(ChoiceRegister userRegister) async {
    setState(() {
      loading = true;
    });
    if (_formKey.currentState!.validate()) {
      result = await userRegister.registerWithEmailAndPassword(
          email: _emailController.text, password: _pwdController.text);
    }
    await Future.delayed(const Duration(seconds: 2));
    if (result == null) {
      setState(() {
        error = 'please supply a valid email';
        loading = false;
      });
    }
  }

    Future<void> handleSignIn(ChoiceSignIn userSignin) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      result = await userSignin.signInWithEmailAndPassword(
          email: _emailController.text, password: _pwdController.text);
      await Future.delayed(const Duration(seconds: 2));
      if (result == null) {
        setState(() {
          error = 'Could not sign in with those credentials';
          loading = false;
        });
      }
    }
  }
}

// mixin AppPressHandler<T extends StatefulWidget> on State<T> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _pwdController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();




// }
