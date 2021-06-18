// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

/// Custom Widgets
import 'package:jadwalnya/model/drawer_item.dart';
import 'package:jadwalnya/screen/components/my_appbar.dart';
import 'package:jadwalnya/screen/components/my_enddrawer.dart';
import 'package:jadwalnya/screen/components/my_expandable_fab.dart';

import 'fragments/dashboard_fragments.dart';

// import 'package:carou'
class DashboardScreen extends StatefulWidget {
  static const NAME = 'dashboard';

  final drawerItems = [
    new DrawerItem(
        title: 'Dashboard', icon: Icon(Icons.dashboard), data: new Dashboard()),
    new DrawerItem(
        title: 'Announcement',
        icon: Icon(Icons.announcement),
        data: new Announcement()),
    new DrawerItem(
        title: 'Schedule', icon: Icon(Icons.schedule), data: new Schedule()),
    new DrawerItem(
        title: 'Assignment',
        icon: Icon(Icons.assignment),
        data: new Assignment()),
    new DrawerItem(
        title: 'Quiz', icon: Icon(Icons.architecture), data: new Quiz()),
    new DrawerItem(
        title: 'Manage Class',
        icon: Icon(Icons.class_),
        data: new ManageClass()),
    new DrawerItem(
        title: 'Settings', icon: Icon(Icons.settings), data: new Settings()),
  ];

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentCount = 0;

  @override
  void initState() {
    super.initState();
    _currentCount = 0;
  }

  _onSelectItem(int index, BuildContext context) {
    setState(() => _currentCount = index);
    bool _isMobile = MediaQuery.of(context).size.width < 650;

    /// We don't want to pop if the drawer is fixed.
    _isMobile ?? Navigator.of(context).pop();
  }

  /// Get which fragment is currently being (and will be) opened
  Widget _getDrawerFragments(int pos) => widget.drawerItems[pos].data;

  List<Widget> drawerOptions(context) {
    List<Widget> drawerItems = [];

    for (int i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerItems.add(new ListTile(
        leading: d.icon,
        title: new Text('${d.title}'),
        selected: i == _currentCount,
        onTap: () => _onSelectItem(i, context),
      ));
    }
    return drawerItems;
  }

  @override
  Widget build(BuildContext context) {
    bool _isTablet = MediaQuery.of(context).size.width >= 705;
    bool _isDesktop = MediaQuery.of(context).size.width >= 950;
    bool _isSmol = MediaQuery.of(context).size.width <= 950;
    return Scaffold(
        drawerEnableOpenDragGesture: !_isTablet,

        /// End Drawer only visible on mobile and tablet
        endDrawer: _isSmol
            ? Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Card(
                    child: Center(
                  child: Text('Classmates List'),
                )),
              )
            : null,

        /// Drawer only visible on mobile.
        drawer: !_isTablet
            ? Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: buildDrawer(context, true))
            : null,

        /// We're using a custom AppBar. Preferably a custom icon, too.
        appBar: PreferredSize(
            child: MyAppBar(isTablet: _isTablet, isSmol: _isSmol),
            preferredSize: Size.fromHeight(72)),

        /// I don't know if we need SafeArea *at all*, but hey, better have it
        /// now and fix it later than don't have it and make everything go kaboom.
        body: SafeArea(child: LayoutBuilder(
          builder: (context, constraints) {
            /// Row is used to display the three panes:
            /// - Drawer,
            /// - Main content (or called fragments, though not actually fragments)
            /// - Classmates list
            /// Lecturer should get a separate UI to pick the class they are maintaining.
            return Flex(
              direction: Axis.horizontal,
              children: [
                /// The drawer, if visible.
                Visibility(
                  /// If the device is larger than 705 (tablet),
                  visible: _isTablet,

                  /// the screen is large enough to lock the drawer.
                  child: Expanded(
                    flex: 2,
                    child: buildDrawer(context, false),
                  ),
                ),

                /// Main content
                Expanded(
                    flex: 5,
                    child: Scaffold(
                      body: _getDrawerFragments(_currentCount),
                      floatingActionButton: ExpandableFab(
                        distance: 112.0,
                        children: [
                          ActionButton(
                            hint: 'New Announcement',
                            icon: Icon(Icons.announcement),
                            onPressed: () {},
                          ),
                          ActionButton(
                            hint: 'New Schedule',
                            icon: Icon(Icons.schedule),
                            onPressed: () {},
                          ),
                          ActionButton(
                            hint: 'New Assignment',
                            icon: Icon(Icons.assignment),
                            onPressed: () {},
                          ),
                          ActionButton(
                            hint: 'New Architecture',
                            icon: Icon(Icons.architecture),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )),

                /// Classmates list is only visible on desktop.
                /// Otherwise, it will use an end drawer.
                Visibility(visible: _isDesktop, child: MyEndDrawer())
              ],
            );
          },
        )));
  }

  /// Build Left Drawer
  Card buildDrawer(BuildContext context, bool isMobile) {
    return Card(
      elevation: 4,
      child: Container(
        // height: isMobile ? 400 : 620,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(16.0))),
        child: ListView(
          children: drawerOptions(context),
        ),
      ),
    );
  }
}
