//@dart=2.9
import 'package:flutter/material.dart';

class MyEndDrawer extends StatelessWidget {
  const MyEndDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _textTheme = Theme.of(context).textTheme;
    return Expanded(
      flex: 2,
      child: Card(
        elevation: 4.0,
        child: Container(
            height: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(16.0)),
            ),
            child: Flex(
                direction: Axis.vertical,
                mainAxisSize: MainAxisSize.max,
                children: [
                  FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Classmate list'.toUpperCase(),
                        style: _textTheme.overline.copyWith(fontSize: 14),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: false,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('Friend ${index + 1}'),
                            subtitle: Text('Online'),
                            leading: CircleAvatar(
                              child: Text('F${index + 1}'),
                            ),
                            trailing: Icon(Icons.work),
                          );
                        }),
                  ),
                ])),
      ),
    );
  }
}
