import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:no_name_app/widget/global/frosted_glass.dart';



// class LoginScreen extends StatelessWidget {
//   final double? _deviceHeight, _deviceWidth;
//   const LoginScreen(
//       {Key? key, required double deviceHeight, required double deviceWidth})
//       : _deviceHeight = deviceHeight,
//         _deviceWidth = deviceWidth,
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       appBar: CustomAppBar(),
//       body: Center(
//         child: FrostedGlassBox(
//           boxWidth: 200.0,
//           boxHeight: 200.0,
//           boxChild: Text(
//             "hello world",
//             style: TextStyle(color: Colors.white54, fontSize: 30.0),
//           ),
//         ),
//       ),
//     );
//   }
// }



class LoginScreen extends StatefulWidget {
  static const String imgBackground = 'assets/images/forest.jpg';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // frostedChild: const Text(
              //   'Hello World!',
              //   style: TextStyle(
              //     color: Colors.white54,
              //     fontSize: 30.0,
              //   ),
              // ),
            ),
            loginColumn()
          ],
        ),
      ),
    );
  }
}

Widget loginColumn() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.android,
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
        Text(
          "Hello Again!",
          style: GoogleFonts.bebasNeue(
            textStyle: const TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.bold,
            ),
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
            child: const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: TextField(
                decoration: InputDecoration(
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
            child: const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
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
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
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
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
  );
}
