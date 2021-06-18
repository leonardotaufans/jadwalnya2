import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
    return SafeArea(
      child: Scaffold(
          body: Align(
              alignment: Alignment.bottomCenter,
              child: Center(
                  child: FittedBox(
                child: Card(
                  child: Column(
                    children: [
                      Text(
                        'Welcome',
                        style: _theme.textTheme.headline1!.copyWith(fontSize: 64),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: WelcomeWidget(),
                      ),
                    ],
                  ),
                ),
              )))),
    );
  }


}

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  _WelcomeWidgetState createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  /// currentPosition values:
  /// 0 -> Welcome
  /// 1 -> Sign in
  /// 2 -> Sign up

  int currentPosition = 0;

  Future<bool> _onWillPop() async {
    if (currentPosition != 0) {
      currentPosition--;
    } else {
      Navigator.of(context).pop(true);
      return true;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    TextStyle linkStyle = TextStyle(color: Colors.green);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Flex(direction: Axis.vertical,
          children: [
            buildRichText(linkStyle),
            SizedBox(
              height: 20,
            ),

            Visibility(child: Text('OwO'), visible: currentPosition == 1,),
            SizedBox(
                width: 200,
                child: ElevatedButton(
                    child: Text('Sign in'), onPressed: () {
                      setState(() => currentPosition = 1);
                })),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 200,
                child: ElevatedButton(
                  child: Text('Sign up'),
                  onPressed: () {
                    setState(() => currentPosition = 1);
                  },
                )),
            SizedBox(
              height: 20,
            ),
          ],
        ),
    );
  }
  // constant
  static RichText buildRichText(TextStyle linkStyle) {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(
            text: 'To use this app, you must sign in first. '
                'Signing in means you agreed to our '),
        TextSpan(
            text: 'Terms of Service ',
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('ToS tapped');
              }),
        TextSpan(text: 'and '),
        TextSpan(
            text: 'Privacy Agreement.',
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('Privacy tapped');
              })
      ]),
    );
  }
}
