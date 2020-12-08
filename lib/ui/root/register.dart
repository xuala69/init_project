import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:init_project/locator.dart';
import 'package:init_project/models/userModel.dart';
import 'package:init_project/services/api.dart';
import 'package:init_project/services/secure_service.dart';
import 'package:init_project/providers/userProvider.dart';
import 'package:init_project/ui/root/login.dart';
import 'package:init_project/utils/size_config.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:init_project/ui/home_main.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var _api = locator<Api>();
  var _secure = locator<SecureService>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pw1 = TextEditingController();
//  TextEditingController _pw2 = TextEditingController();
  TextEditingController _phone = TextEditingController();

  Future<Map> _submitRegister() async {
    var _userData = {
      "firstname": _name.text.toString(),
      "lastname": "na",
      "email": _email.text.toString(),
      "password": _pw1.text.toString(),
      "confirm": _pw1.text.toString(),
      "telephone": _phone.text.toString(),
      "customer_group_id": 1.toString(),
      "agree": 1.toString(),
    };
    var registerResponse = await _api.registerUser(_userData);
    if (registerResponse.statusCode == 200) {
      Map _data = jsonDecode(registerResponse.body);
      if (_data['success'] == 1) {
        await _secure.write("signedIn", "true");
        return _data;
      } else {
        String error = _data['error'][0];
        Map _error = {"success": 2, "error": error};
        return _error;
      }
    } else if (registerResponse != null) {
      Map _data = jsonDecode(registerResponse.body);
      String error = _data['error'][0];
      Map _error = {"success": 2, "error": error};
      return _error;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Register user"),
        centerTitle: true,
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        width: SizeConfig.width,
        height: SizeConfig.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Kumtluang"),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      padding: EdgeInsets.only(left: 5),
                      child: TextFormField(
                        controller: _name,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Full Name",
                            focusColor: Theme.of(context).selectedRowColor),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      padding: EdgeInsets.only(left: 5),
                      child: TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                            border: InputBorder.none, labelText: "email"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      padding: EdgeInsets.only(left: 5),
                      child: TextFormField(
                        controller: _pw1,
                        decoration: InputDecoration(
                            border: InputBorder.none, labelText: "Password"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      padding: EdgeInsets.only(left: 5),
                      child: TextFormField(
                        controller: _phone,
                        decoration: InputDecoration(
                            border: InputBorder.none, labelText: "Phone"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    FlatButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
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
                                      Text("Creating account..."),
                                    ],
                                  ),
                                );
                              });
                          Map body = await _submitRegister();
                          if (body['success'] == 1) {
                            UserModel _user = UserModel.fromJson(body);
                            _userProvider.saveProfile(_user);
                            Navigator.pop(context);
                            pushNewScreen(
                              context,
                              screen: HomeMain(),
                              withNavBar:
                                  false, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          } else if (body['success'] == 2) {
                            Navigator.pop(context);
                            Fluttertoast.showToast(
                                msg: body['error'],
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            Navigator.pop(context);
                            Fluttertoast.showToast(
                                msg: "Error reaching server",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        }
                      },
                      color: Colors.amberAccent,
                      child: Text("Register"),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => LoginPage()));
                    },
                    child: Text("Already have account? Login"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
