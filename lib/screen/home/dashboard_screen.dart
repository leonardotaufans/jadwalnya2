// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:jadwalnya/model/assignment.dart';

/// Custom Widgets
import 'package:jadwalnya/model/drawer_item.dart';
import 'package:jadwalnya/model/schedule.dart';
import 'package:jadwalnya/model/score.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../responsive.dart';
import 'fragments/schedule_fragment.dart';
// import 'fragments/dashboard_fragments.dart';

class DashboardScreen extends StatefulWidget {
  static const NAME = 'dashboard';

  final drawerItems = [
    new DrawerItem(
        title: 'Home', icon: Icon(Icons.home), data: new Dashboard()),
    new DrawerItem(
        title: 'Announcement',
        icon: Icon(Icons.announcement),
        data: new Announcement()),
    new DrawerItem(
        title: 'Manage Class',
        icon: Icon(Icons.apartment),
        data: new ManageClass()),
    new DrawerItem(
        title: 'Accounts', icon: Icon(Icons.person), data: new Settings()),
  ];

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Width: ${MediaQuery.of(context).size.width}'),
      ),
      body: Flex(direction: Axis.horizontal, children: [
        /// Side Navigation Bar if used
        Visibility(
          visible: Responsive.isWideScreen(context),
          child: Flexible(
              flex: 1,
              child: Container(
                child: buildSideNavigation(),
              )),
        ),

        /// Main Content
        Flexible(
          flex: 7,
          child: widget.drawerItems[_index].data,
        ),
      ]),
      bottomNavigationBar:
          Responsive.isMobile(context) ? buildBottomNavBar() : null,
      floatingActionButton: SpeedDialFab(),
    );
  }

  /// Bottom Navigation Bar will be used if the device is not widescreen.
  BottomNavigationBar buildBottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.green.shade400,
      unselectedItemColor: Colors.white54,
      currentIndex: _index,
      onTap: (newIndex) {
        setState(() => _index = newIndex);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule),
          label: 'Schedule',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: 'Announcement'),
        BottomNavigationBarItem(
            icon: Icon(Icons.apartment), label: 'Classroom'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
      ],
    );
  }

  /// If the device is widescreen, SideNav will be used instead.
  ListView buildSideNavigation() {
    return ListView.builder(
        shrinkWrap: false,
        scrollDirection: Axis.vertical,
        itemCount: widget.drawerItems.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                _index = index;
              });
            },
            child: Ink(
              color: Theme.of(context).primaryColor,
              child: Container(
                color: _index == index ? Theme.of(context).canvasColor : null,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.drawerItems[index].icon,
                    Text(
                      widget.drawerItems[index].title,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class SpeedDialFab extends StatelessWidget {
  const SpeedDialFab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      buttonSize: 48,
      label: Text('Create new...'),
      animatedIcon: AnimatedIcons.menu_close,
      children: [
        SpeedDialChild(
            onTap: () {},
            label: 'Announcement',
            child: Icon(Icons.notifications)),
        SpeedDialChild(
            onTap: () {}, label: 'Assignment', child: Icon(Icons.assignment)),
        SpeedDialChild(
            onTap: () {}, label: 'Schedule', child: Icon(Icons.schedule)),
        SpeedDialChild(
            onTap: () {}, label: 'Exams', child: Icon(Icons.text_snippet)),
      ],
    );
  }
}

class Announcement extends StatelessWidget {
  const Announcement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Announcement!'),
    );
  }
}

class ManageClass extends StatelessWidget {
  const ManageClass({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Manage Class!'),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Settings!'),
    );
  }
}
// class _DashboardScreenState extends State<DashboardScreen> {
//   int _currentCount = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _currentCount = 0;
//   }
//
//   _onSelectItem(int index, BuildContext context) {
//     setState(() => _currentCount = index);
//     bool _isMobile = MediaQuery.of(context).size.width < 950;
//
//     /// We don't want to pop if the drawer is fixed.
//     _isMobile ?? Navigator.of(context).pop();
//   }
//
//   /// Get which fragment is currently being (and will be) opened
//   Widget _getDrawerFragments(int pos) => widget.drawerItems[pos].data;
//
//   List<Widget> drawerOptions(context) {
//     List<Widget> drawerItems = [];
//
//     for (int i = 0; i < widget.drawerItems.length; i++) {
//       var d = widget.drawerItems[i];
//       drawerItems.add(new ListTile(
//         leading: d.icon,
//         title: new Text('${d.title}'),
//         selected: i == _currentCount,
//         onTap: () => _onSelectItem(i, context),
//       ));
//     }
//     return drawerItems;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     bool _isTablet = MediaQuery.of(context).size.width >= 705;
//     bool _isDesktop = MediaQuery.of(context).size.width >= 950;
//     bool _isSmol = MediaQuery.of(context).size.width <= 950;
//     return Scaffold(
//         drawerEnableOpenDragGesture: !_isTablet,
//
//         /// End Drawer only visible on mobile and tablet
//         endDrawer: _isSmol
//             ? Container(
//                 width: MediaQuery.of(context).size.width * 0.7,
//                 child: Card(
//                     child: Center(
//                   child: Text('Classmates List'),
//                 )),
//               )
//             : null,
//
//         /// Drawer only visible on mobile.
//         drawer: !_isTablet
//             ? Container(
//                 width: MediaQuery.of(context).size.width * 0.7,
//                 child: buildDrawer(context, true))
//             : null,
//
//         /// We're using a custom AppBar. Preferably a custom icon, too.
//         appBar: PreferredSize(
//             child: MyAppBar(isTablet: _isTablet, isSmol: _isSmol),
//             preferredSize: Size.fromHeight(72)),
//
//         /// I don't know if we need SafeArea *at all*, but hey, better have it
//         /// now and fix it later than don't have it and make everything go kaboom.
//         body: SafeArea(child: LayoutBuilder(
//           builder: (context, constraints) {
//             /// Row is used to display the three panes:
//             /// - Drawer,
//             /// - Main content (or called fragments, though not actually fragments)
//             /// - Classmates list
//             /// Lecturer should get a separate UI to pick the class they are maintaining.
//             return Flex(
//               direction: Axis.horizontal,
//               children: [
//                 /// The drawer, if visible.
//                 Visibility(
//                   /// If the device is larger than 705 (tablet),
//                   visible: _isTablet,
//
//                   /// the screen is large enough to lock the drawer.
//                   child: Expanded(
//                     flex: 2,
//                     child: buildDrawer(context, false),
//                   ),
//                 ),
//
//                 /// Main content
//                 Expanded(
//                     flex: 5,
//                     child: Scaffold(
//                       body: _getDrawerFragments(_currentCount),
//                       floatingActionButton: ExpandableFab(
//                         distance: 112.0,
//                         children: [
//                           ActionButton(
//                             hint: 'New Announcement',
//                             icon: Icon(Icons.announcement),
//                             onPressed: () {},
//                           ),
//                           ActionButton(
//                             hint: 'New Schedule',
//                             icon: Icon(Icons.schedule),
//                             onPressed: () {},
//                           ),
//                           ActionButton(
//                             hint: 'New Assignment',
//                             icon: Icon(Icons.assignment),
//                             onPressed: () {},
//                           ),
//                           ActionButton(
//                             hint: 'New Architecture',
//                             icon: Icon(Icons.architecture),
//                             onPressed: () {},
//                           ),
//                         ],
//                       ),
//                     )),
//
//                 /// Classmates list is only visible on desktop.
//                 /// Otherwise, it will use an end drawer.
//                 Visibility(visible: _isDesktop, child: MyEndDrawer())
//               ],
//             );
//           },
//         )));
//   }
//
//   /// Build Left Drawer
//   Card buildDrawer(BuildContext context, bool isMobile) {
//     return Card(
//       elevation: 4,
//       child: Container(
//         // height: isMobile ? 400 : 620,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(topRight: Radius.circular(16.0))),
//         child: ListView(
//           children: drawerOptions(context),
//         ),
//       ),
//     );
//   }
// }
