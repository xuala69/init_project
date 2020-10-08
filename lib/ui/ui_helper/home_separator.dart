import 'package:flutter/material.dart';
import 'package:init_project/utils/size_config.dart';

class HomeSeparator extends StatelessWidget {
  final String title;
  HomeSeparator({@required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            width: SizeConfig.width,
            height: 1,
            color: Colors.black38,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(title),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
            width: SizeConfig.width,
            height: 1,
            color: Colors.black38,
          ),
        ),
      ],
    );
  }
}
