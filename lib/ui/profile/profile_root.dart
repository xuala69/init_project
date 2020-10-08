import 'package:flutter/material.dart';
import 'package:init_project/providers/theme_provider.dart';
import 'package:init_project/ui/common_widgets/text_demo.dart';
import 'package:provider/provider.dart';

class ProfileRoot extends StatefulWidget {
  @override
  _ProfileRootState createState() => _ProfileRootState();
}

class _ProfileRootState extends State<ProfileRoot> {
  static bool _switchOn = false;
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Switch(
            value: themeChange.darkTheme,
            onChanged: (val) {
              setState(() {
                themeChange.darkTheme = val;
                _switchOn = !_switchOn;
              });
            }),
      ),
      body: Container(
        child: TextDemo(),
      ),
    );
  }
}
