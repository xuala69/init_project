import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:init_project/locator.dart';
import 'package:init_project/models/userModel.dart';
import 'package:init_project/providers/userProvider.dart';
import 'package:init_project/services/api.dart';
import 'package:init_project/ui/home_main.dart';
import 'package:init_project/ui/root/register.dart';
import 'package:init_project/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _api = locator<Api>();
  TextEditingController _email = TextEditingController();
  TextEditingController _pw = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var _user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.green[100],
        width: SizeConfig.width,
        height: SizeConfig.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Login"),
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                        //  border: InputBorder.none,
                        labelText: "E-mail",
                        prefixIcon: Icon(Icons.email),
                        focusColor: Theme.of(context).selectedRowColor),
                  ),
                  TextFormField(
                    controller: _pw,
                    decoration: InputDecoration(
                        // border: InputBorder.none,
                        labelText: "Password",
                        prefixIcon: Icon(Icons.hourglass_empty_outlined),
                        focusColor: Theme.of(context).selectedRowColor),
                  ),
                  FlatButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Container(
                                width: 25,
                                height: 25,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Logging in..."),
                                ],
                              ),
                            );
                          });
                      var result = await _api.loginUser(
                          email: _email.text, password: _pw.text);
                      if (result["success"] == 1) {
                        Map _body = result['data'];
                        UserModel _model = UserModel.fromJson(_body);
                        _user.saveProfile(_model);
                        Navigator.pop(context);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => HomeMain()));
                        print("Success");
                      } else if (result["success"] == 2) {
                        Navigator.pop(context);
                        Fluttertoast.showToast(
                            msg: result['error'],
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        Navigator.pop(context);
                        Fluttertoast.showToast(
                            msg: "Login failed",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    color: Colors.cyan,
                    child: Text("Login"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => RegisterPage()));
                        },
                        child: Text("Don/'t have account? Register"),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
