import 'package:flutter/material.dart';
import 'package:init_project/utils/constants.dart';
import 'package:init_project/utils/size_config.dart';

class LogoutBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 5,
        ),
        margin: EdgeInsets.only(
            left: Constants.paddingLeft, right: Constants.paddingRight),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.blueGrey[800],
          ),
        ),
        width: SizeConfig.width,
        child: Center(
          child: Text('LOGOUT'),
        ),
      ),
    );
  }
}
