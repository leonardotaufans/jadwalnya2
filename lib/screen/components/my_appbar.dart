//@dart=2.9
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
    @required bool isTablet,
    @required isSmol,
  })  : _isTablet = isTablet,
        _isSmol = isSmol,
        super(key: key);

  final bool _isTablet;
  final bool _isSmol;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Builder(
        builder: (context) {
          return !_isTablet
              ? IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          )
              : CircleAvatar(
            child: Text('LT'),
          );
        },
      ),
      title: Text('Hello, Leonardo Taufan'),
      // subtitle: Text('Meowrenzi#3201'),
      subtitle: Text(
          'Current width: ${MediaQuery.of(context).size.width}, current height: ${MediaQuery.of(context).size.height}'),
      trailing: _isSmol
          ? Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.people),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      )
          : null,
    );
  }
}
