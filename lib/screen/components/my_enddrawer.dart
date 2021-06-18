//@dart=2.9
import 'package:flutter/material.dart';

class MyEndDrawer extends StatelessWidget {
  const MyEndDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Card(
        elevation: 4.0,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.0)),
            ),
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Friend ${index + 1}'),
                    subtitle: Text('Online'),
                    leading: CircleAvatar(
                      child: Text('F${index + 1}'),
                    ),
                    trailing: Icon(Icons.work),
                  );
                })),
      ),
    );
  }
}
