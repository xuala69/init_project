import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:init_project/ui/home_content/home_content.dart';
import 'package:init_project/ui/profile/profile_root.dart';
import 'package:init_project/ui/search_page/search_main.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    SearchPage(),
    ProfileRoot(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  GButton(
                      icon: Icons.home,
                      iconColor: Theme.of(context).iconTheme.color,
                      text: 'Home',
                      textStyle: Theme.of(context).textTheme.headline6),
                  GButton(
                    icon: Icons.search,
                    text: 'Search',
                    iconColor: Theme.of(context).iconTheme.color,
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                  GButton(
                    icon: MdiIcons.accountCircleOutline,
                    text: 'Profile',
                    iconColor: Theme.of(context).iconTheme.color,
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
