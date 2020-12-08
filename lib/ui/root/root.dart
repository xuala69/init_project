import 'package:flutter/material.dart';
import 'package:init_project/locator.dart';
import 'package:init_project/services/api.dart';
import 'package:init_project/services/secure_service.dart';
import 'package:init_project/ui/home_main.dart';
import 'package:init_project/ui/root/login.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  var _api = locator<Api>();
  var _secure = locator<SecureService>();

  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }

  checkLoginStatus() async {
    var signedIn = await _secure.read("signedIn");
    _secure.write("signedIn", "false");
    if (signedIn == "true") {
      var tokenExpire = await _secure.read("tokenExpire");
      bool expired = false;
      if (expired) {
        await _api.refreshToken(await _secure.read("token"));
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => HomeMain()), (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => HomeMain()), (route) => false);
      }
    } else {
      await _api.createToken();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => LoginPage()), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            checkLoginStatus();
          },
        ),
        body: Container(
          child: Center(child: CircularProgressIndicator()),
        ));
  }
}
