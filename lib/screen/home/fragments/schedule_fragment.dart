//@dart=2.9
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jadwalnya/components/custom/assignment_card.dart';
import 'package:jadwalnya/components/custom/score_card.dart';
import 'package:jadwalnya/components/custom/textbtn_right.dart';
import 'package:jadwalnya/components/custom/you_textbox.dart';
import 'package:jadwalnya/model/assignment.dart';
import 'package:jadwalnya/model/schedule.dart';
import 'package:jadwalnya/model/score.dart';
import 'package:jadwalnya/responsive.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key key,
  }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Schedule> placeholderDashboard = [
    new Schedule(
        id: '123456789',
        name: 'Jadwal 1',
        altName: 'J1',
        day: 'Sabtu',
        startTime: '09:30',
        endTime: '12:30',
        location: 'A13-31',
        scores: [
          new Score(
              scoreId: 'Jadwal1-1263456789',
              scheduleId: '123456789',
              scoreName: 'Quiz 1',
              scoreUser: 98.0,
              scoreMin: 60),
          new Score(
              scoreId: 'Jadwal1-987654321',
              scheduleId: '123456789',
              scoreName: 'Quiz 2',
              scoreUser: 55.0,
              scoreMin: 60),
        ]),
    new Schedule(
        id: '123456789',
        name: 'Jadwal 2',
        altName: 'J1',
        day: 'Sabtu',
        startTime: '09:30',
        endTime: '12:30',
        location: 'A13-31',
        assignments: [
          new Assignment(
              id: 'Jadwal3-Assign13579',
              name: 'Assignment 1',
              desc: 'Assignment 1 for Jadwal 2',
              dueDate: '21/12/2021 09:00',
              scheduleId: '123456789',
              isFinished: false,
              expiryDate: '31/12/2021',
              uploaderId: 'user123'),
          new Assignment(
              id: 'Jadwal3-Assign13579',
              name: 'Assignment 1',
              desc: 'Assignment 1 for Jadwal 2',
              dueDate: '21/12/2021 09:00',
              scheduleId: '123456789',
              isFinished: false,
              expiryDate: '31/12/2021',
              uploaderId: 'user123'),
        ]),
  ];

  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = new PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.start,
        direction: Axis.vertical,
        children: [
          Flexible(
            flex: 1,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    child: RawChip(
                      elevation: 8,
                      avatar: CircleAvatar(
                        child: Text('J$index'),
                      ),
                      label: Container(
                        padding: EdgeInsets.fromLTRB(0, 4, 4, 4),
                        constraints: BoxConstraints(
                            minHeight: 24,
                            minWidth: 80,
                            maxWidth: 160,
                            maxHeight: 72),
                        child: Text(
                          '${placeholderDashboard[index].name}',
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      onPressed: () => pageController.jumpToPage(index),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 8.0,
                  );
                },
                itemCount: placeholderDashboard.length),
          ),
          Flexible(
            flex: 8,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return SchedFragment(
                  schedule: placeholderDashboard[index],
                );
              },
              itemCount: placeholderDashboard.length,
              controller: pageController,
            ),
          )
        ],
      ),
    );
  }
}

class SchedFragment extends StatefulWidget {
  const SchedFragment({Key key, @required this.schedule}) : super(key: key);
  final Schedule schedule;

  @override
  _SchedFragmentState createState() => _SchedFragmentState();
}

class _SchedFragmentState extends State<SchedFragment> {
  @override
  Widget build(BuildContext context) {
    Schedule schedule = widget.schedule;
    return RefreshIndicator(
      onRefresh: refreshData,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(height: 60, child: ScheduleNameWidget(schedule: schedule)),
          SizedBox(height: 8.0),
          Divider(height: 1.0),
          SizedBox(height: 8.0),
          Text('Your Assignment'),
          SizedBox(height: 8.0),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 600, minHeight: 80),
            child: schedule.assignments != null
                ? AssignmentViewGrid(schedule: schedule)
                : Text('Empty'),
          ),
          SizedBox(height: 8.0),
          Text('Your Latest Quiz'),
          SizedBox(height: 4.0),
          Visibility(
              visible: schedule.scores != null,
              child: SizedBox(
                height: 160,
                child: ScheduleScore(schedule: schedule),
              )),
        ],
      ),
    );
  }

  Future refreshData() async {
    setState(() {});
  }
}

class ScheduleScore extends StatelessWidget {
  const ScheduleScore({
    Key key,
    @required this.schedule,
  }) : super(key: key);

  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
              width: 8.0,
            ),
        itemCount: schedule.scores != null ? schedule.scores.length : 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var scoreValue = schedule.scores;
          return ScoreCard(score: scoreValue[index]);
        });
  }
}

class AssignmentViewGrid extends StatefulWidget {
  const AssignmentViewGrid({
    Key key,
    @required this.schedule,
  }) : super(key: key);

  final Schedule schedule;

  @override
  _AssignmentViewGridState createState() =>
      _AssignmentViewGridState(this.schedule);
}

class _AssignmentViewGridState extends State<AssignmentViewGrid> {
  final Schedule schedule;
  int present = 0;
  int perPage = 4;

  _AssignmentViewGridState(this.schedule);

  List<Assignment> pageAssignment = [];
  List<Assignment> assignments;

  @override
  void initState() {
    super.initState();
    assignments = schedule.assignments;
    setState(() {
      int endPage = (assignments.length < perPage) ? assignments.length : perPage;
      pageAssignment.addAll(assignments.getRange(present, present + endPage));
      present = present + perPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => SizedBox(height: 4.0,),
          itemCount: (present <= assignments.length)
              ? pageAssignment.length + 1
              : pageAssignment.length,
          itemBuilder: (context, index) {
            return (index == pageAssignment.length )
                ? ElevatedButton(
                    child: Text('Load more'),
                    onPressed: () {
                      setState(() {
                        if ((present + perPage) > assignments.length) {
                          pageAssignment.addAll(assignments.getRange(
                              present, assignments.length));
                        } else {
                          pageAssignment.addAll(
                              assignments.getRange(present, present + perPage));
                        }
                        present = present + perPage;
                      });
                    },
                  )
                : AssignmentCard(assignment: assignments[index]);
          });
    } else {
      return GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: widget.schedule.assignments != null
              ? widget.schedule.assignments.length
              : 0,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 16 / 5,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0),
          itemBuilder: (context, index) {
            return AssignmentCard(
                assignment: widget.schedule.assignments[index]);
          });
    }
  }
}

class ScheduleNameWidget extends StatelessWidget {
  const ScheduleNameWidget({
    Key key,
    @required this.schedule,
  }) : super(key: key);

  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white30,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              child: Text('${schedule.altName}'),
            ),
            SizedBox(
              width: 8.0,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: '${schedule.name}\n',
                    style: Theme.of(context).textTheme.headline6),
                TextSpan(
                    text:
                        '${schedule.day}, ${schedule.startTime} - ${schedule.endTime}\n',
                    style: Theme.of(context).textTheme.caption),
                TextSpan(
                    text: '${schedule.location}',
                    style: Theme.of(context).textTheme.caption)
              ]),
            )
          ],
        ),
      ),
    );
  }
}
