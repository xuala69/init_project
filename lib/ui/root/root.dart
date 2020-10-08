import 'package:flutter/material.dart';
import 'package:init_project/ui/home_main.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    checkSomething();
    super.initState();
  }

  checkSomething() async {
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => HomeMain()), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(child: CircularProgressIndicator()),
    ));
  }
}
