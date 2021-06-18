// @dart=2.9
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Card buildTaskCard(var mColor, String title, Icon icon, ThemeData theme,
      String subtitle, int count) {
    return Card(
      elevation: 4,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: mColor, borderRadius: BorderRadius.circular(4)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                child: icon,
              ),
              Text(
                '$count',
                style: theme.textTheme.headline1.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text('${title.toUpperCase()}',
                      style: theme.textTheme.overline.copyWith(fontSize: 14)),
                  Text(
                    '${subtitle.toUpperCase()}',
                    style: theme.textTheme.caption.copyWith(fontSize: 10),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        scrollDirection: Axis.vertical,
        children: [
          Container(
              child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: buildTaskCard(Colors.white, 'TUGAS',
                      Icon(Icons.assignment), theme, 'Dalam 7 hari', -1)),
              Expanded(
                  flex: 1,
                  child: buildTaskCard(Colors.white, 'JADWAL',
                      Icon(Icons.schedule), theme, 'Hari ini', -1)),
              Expanded(
                  flex: 1,
                  child: buildTaskCard(Colors.white, 'KUIS',
                      Icon(Icons.architecture), theme, 'Dalam 7 hari', -1)),
            ],
          )),
          SizedBox(
            height: 4.0,
          ),
          Text(
            'ANNOUNCEMENT',
            style: theme.textTheme.overline,
          ),
          Container(
              width: double.infinity,
              height: 200,
              child: CarouselSlider.builder(
                  itemCount: 8,
                  itemBuilder: (context, index, _) {
                    return Card(
                      elevation: 4,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.0)),
                        width: double.infinity,
                        child: Center(child: Text('Item #$index')),
                      ),
                    );
                  },
                  options: CarouselOptions(
                      pauseAutoPlayOnTouch: true,
                      enlargeCenterPage: true,
                      height: 180,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 10),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal))),
          SizedBox(
            height: 4.0,
          ),
          Text('Schedule'),
          Card(
            elevation: 4,
            child: Container(
                height: 320,
                child: ListView.separated(
                    itemCount: 4,
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20), child: Divider(),
                      );
                    },
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text('J$index'),
                        ),
                        title: Text('Index #$index'),
                        subtitle:
                            Text('Desc for #$index\nThird line for #$index'),
                        isThreeLine: true,
                      );
                    })),
          ),
          TextButton(onPressed: () {}, child: Text('SHOW MORE'))
        ],
    );
  }
}

class Announcement extends StatelessWidget {
  const Announcement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Announcement!'),
      ),
    );
  }
}

class Schedule extends StatelessWidget {
  const Schedule({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Schedule!'),
      ),
    );
  }
}

class Assignment extends StatelessWidget {
  const Assignment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Assignment!'),
      ),
    );
  }
}

class Quiz extends StatelessWidget {
  const Quiz({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Quiz!'),
      ),
    );
  }
}

class ManageClass extends StatelessWidget {
  const ManageClass({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Manage Class!'),
      ),
    );
  }
}

class ScheduleDynamic extends StatefulWidget {
  final String scheduleName;
  final List<Assignment> assignments;

  const ScheduleDynamic(
      {Key key, this.scheduleName = "Blank", this.assignments})
      : super(key: key);

  @override
  _ScheduleDynamicState createState() =>
      _ScheduleDynamicState(scheduleName, assignments);
}

class _ScheduleDynamicState extends State<ScheduleDynamic> {
  final String scheduleName;
  final List<Assignment> assignments;

  _ScheduleDynamicState(this.scheduleName, this.assignments);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String schedName = scheduleName != null ? scheduleName : "ERRORNO";
    int assignment = assignments != null ? assignments.length : 0;
    return Container(
      child: Center(
        child: Text('$schedName has $assignment assignments.'),
      ),
    );
  }
}
