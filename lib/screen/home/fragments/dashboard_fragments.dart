// @dart=2.9
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jadwalnya/screen/components/card_announcement.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Widget buildTaskCard(var mColor, String title, Icon icon, ThemeData theme,
      String subtitle, int count) {
    return Container(
      height: 120,
      child: Stack(
        fit: StackFit.passthrough,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Card(),
          Center(
            child: Text(
              '$count',
              style: theme.textTheme.headline5
                  .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: '$title',
                        style:
                        theme.textTheme.bodyText2.copyWith(fontSize: 14)),
                    TextSpan(text: '\n'),
                    TextSpan(
                        text: '${subtitle.toLowerCase()}',
                        style: theme.textTheme.overline.copyWith(fontSize: 12))
                  ])),
            ),
          ),
          Positioned(
            child: Material(
                elevation: 2.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  child: icon,
                  backgroundColor: mColor,
                  foregroundColor: Colors.black54,
                )),
            top: 1,
            left: 1,
            right: 1,
          ),
        ],
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
          style: theme.textTheme.overline.copyWith(fontSize: 14),
        ),
        Container(
          width: double.maxFinite,
          child: CarouselSlider.builder(
              itemCount: 8,
              itemBuilder: (context, index, _) {
                //todo: add onTap behavior
                return AnnouncementCard(
                  name: 'Leonardo Taufan',
                  uid: '@Meowrenzi#3201',
                  initial: 'LT',
                  postDate: '12/21/2021 15:00',
                  textContent:
                  'This should be a really really long content. The length of the text should be enough for the most important things, but if it isn\'t, the text should be wrapped.',
                );
              },
              options: CarouselOptions(
                  pageSnapping: true,
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  height: 300,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 10),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal)),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          'SCHEDULE',
          style: theme.textTheme.overline.copyWith(fontSize: 14),
        ),
        Text(
          'for today',
          style: theme.textTheme.overline.copyWith(fontSize: 12),
        ),
        SizedBox(
          height: 4.0,
        ),
        Card(
            elevation: 4,
            child: ListView.separated(
                shrinkWrap: true,
                itemCount: 4,
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(),
                  );
                },
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('J$index'),
                    ),
                    title: Text('Index #$index'),
                    subtitle: Text('Desc for #$index\nThird line for #$index'),
                    isThreeLine: true,
                  );
                })),

        /// A padding used so when scrolled all the way to the bottom,
        /// content behind FAB is still visible.
        SizedBox(
          height: 60,
        )
      ],
    );
  }
}

class Announcement extends StatelessWidget {
  const Announcement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(scrollDirection: Axis.vertical, itemCount: 9, itemBuilder: (context, index) {
      return Container(
        height: 300,
        width: 400,
        child: AnnouncementCard(name: 'Friend $index',
            uid: '@Friend$index#1234',
            postDate: '1/1/2001 01:01',
            textContent: 'UwU',
            initial: 'F$index'),
      );
    });
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

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Settings!'),
      ),
    );
  }
}
