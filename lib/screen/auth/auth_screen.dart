import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AuthScreen extends StatefulWidget {
  static const NAME = 'auth';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(child: LottieBuilder.asset('assets/lottie/geometric_back.json')),
            Center(child: SizedBox(height: 120, width: 120,child: Container(color: Colors.red,))),
          ],
        ),
      ),
    );
   }
}