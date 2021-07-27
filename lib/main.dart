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
      title: 'Jadwalnya',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.green.shade400
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
