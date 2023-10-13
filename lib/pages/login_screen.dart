import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:no_name_app/user_model/users.dart';
import 'package:no_name_app/users_auth/validate_emai.dart';
import 'package:no_name_app/users_auth/validate_pwd.dart';
import 'package:no_name_app/users_authenticate/user.register.dart';
import 'package:no_name_app/users_authenticate/user_sign_in.dart';
import 'package:no_name_app/widget/global/frosted_glass.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';


// import 'package:flutter_hooks/flutter_hooks.dart';

final textProvider = StateProvider<String>((ref) => '');

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  static const String imgBackground = 'assets/images/forest.jpg';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with ValidatePwd, ValidateEmail ,AppPressHandler {
  final _userSignin = ChoiceSignIn();
  @override
  void initState() {
    super.initState();
    //  final textValue = ref.watch(textProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Container(
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
                  child: Form(
                    key: _formKey,
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
                  
                                child: TextFormField(
                                  validator: (val) => validateEmailAddress(val),
                                  controller: _emailController,
                                  onChanged: (value) {},
                                  decoration: const InputDecoration(
                                    errorText: null,
                                    border: InputBorder.none,
                                    hintText: 'Email',
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
                              child: 
                                TextFormField(
                                  validator: (val) => validatePassword(val),
                                  controller: _pwdController,
                                  onChanged: (value) {},
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    errorText: null
                                  ),
                                  obscureText: true,
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
                          child: ElevatedButton(
                            onPressed: () {
                              handleSignIn(_userSignin);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.amber),
                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.all(20.0)),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                            ),
                            child: const Center(
                              child: Text(
                                // MaterialStateProperty<EdngeInsetsGeometry?>?
                                'Sign In', //EdgeInsets.all(20.0)
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _pwdController.dispose();
    super.dispose();
  }
}

mixin AppPressHandler<T extends StatefulWidget> on State<T> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? error;
  ChoiceUser? result;
  bool loading = false;

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

  Future<void> handleSignIn(
     ChoiceSignIn userSignin) async {
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
