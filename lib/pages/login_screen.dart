import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:no_name_app/auth/validate_pwd.dart';
import 'package:no_name_app/widget/global/frosted_glass.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

// import 'package:flutter_hooks/flutter_hooks.dart';

final textProvider = StateProvider<String>((ref) => '');

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  static const String imgBackground = 'assets/images/forest.jpg';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> with ValidatePwd {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    //  final textValue = ref.watch(textProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(LoginScreen.imgBackground),
            fit: BoxFit.cover, // Goes on until it fits the entire background
          ),
        ),
        // alignment: Alignment.bottomCenter,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            FrostedGlass(
              height: 600.00,
              width: MediaQuery.of(context).size.width,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.flutter_dash,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Login'),
                      Text('|'),
                      Text('Sign Up'),
                    ],
                  ),
                  // TODO: Hello again!

                  const Text(
                    "Hello Again!",
                    style: TextStyle(
                      fontSize: 52,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Welcome back you\'ve been missed',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 50),
                  // TODO: email textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            validator: (val) => validatePassword(val),
                            controller: _emailController,
                            onChanged: (value) {},
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // TODO: Password TextField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            validator: (val) => validatePassword(val),
                            controller: _pwdController,
                            onChanged: (value) {},
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                            ),
                            obscureText: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // TODO: sign button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  // TODO: Not a member? register now
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a Member? ',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Register Now',
                        style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.w800,
                            fontSize: 18.0),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
