import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jadwalnya/model/assignment.dart';

import 'textbtn_right.dart';
import 'you_textbox.dart';

class AssignmentCard extends StatelessWidget {
  const AssignmentCard({Key? key, required this.assignment}) : super(key: key);

  final Assignment assignment;

  @override
  Widget build(BuildContext context) {
    var formatter = DateFormat('dd/MM/yyyy');
    var dateTime = formatter.parse(assignment.dueDate);
    return Container(
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).primaryColor),
        child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${DateFormat('EEEE').format(dateTime)}'),
                      Opacity(
                        opacity: 0.85,
                        child: Text(
                          '${dateTime.day}',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      Text('${DateFormat('MMMM').format(dateTime)}'),
                    ],
                  )),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    YouTextBox(
                        text: Text(
                          '${assignment.name}',
                        )),
                    SizedBox(height: 4.0),
                    ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: 16, maxHeight: 80, maxWidth: 400),
                        child: YouTextBox(
                            borderRadius: BorderRadius.circular(12),
                            text: Text(
                              '${assignment.desc}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            )))
                  ],
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              // VerticalDivider(),
              Expanded(
                flex: 2,
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: TextButtonRight(
                          icon: Icon(Icons.navigate_next_rounded),
                          onPressed: () {},
                          label: Text('Details'),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: TextButtonRight(
                        icon: Icon(Icons.check),
                        onPressed: () {},
                        label: Text('Finish'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
                      child: Divider(
                        height: 2.0,
                      ),
                    ),
                    Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Opacity(
                              opacity: 0.85,
                              child: Text(
                                '${DateTime.now().difference(dateTime).inDays.abs()}',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                            Text(' days left')
                          ],
                        ))
                  ],
                ),
              )
            ]));
  }
}
