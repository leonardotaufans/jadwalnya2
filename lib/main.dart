// @dart=2.9
import 'package:flutter/material.dart';
import 'package:jadwalnya/screen/auth/auth_screen.dart';
import 'package:jadwalnya/screen/home/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => SplashScreen(),
        DashboardScreen.NAME: (_) => DashboardScreen(),
        AuthScreen.NAME: (_) => AuthScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> changePage() async {
    await Future.delayed(Duration(seconds: 1), () {
      // Navigator.pushReplacementNamed(context, 'auth'); //todo: Remove hardcoding
      Navigator.pushReplacementNamed(context, DashboardScreen.NAME);
    });
  }

  @override
  void initState() {
    super.initState();
    changePage();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 80,
            height: 80,
            child: FlutterLogo(
                curve: Curves.bounceInOut, style: FlutterLogoStyle.stacked)));
  }
}
