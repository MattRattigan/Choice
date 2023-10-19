import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_name_app/user_model/users.dart';
import 'package:no_name_app/users_authenticate/user.register.dart';
import 'package:no_name_app/users_authenticate/user_sign_in.dart';


mixin FormHandler <T extends ConsumerStatefulWidget> on ConsumerState<T> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();

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

    Future<void> handleRegister(ChoiceRegister userRegister, GlobalKey<FormState> formKey) async {
    setState(() {
      loading = true;
    });
    if (formKey.currentState!.validate()) {
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


   Future<void> handleSignIn(ChoiceSignIn userSignin, GlobalKey<FormState> formKey) async {
  if (formKey.currentState!.validate()) {
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