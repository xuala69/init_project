import 'package:flutter/material.dart';
import 'package:init_project/utils/constants.dart';
import 'package:init_project/utils/size_config.dart';

class GeneralInfo extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  GeneralInfo({this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Theme.of(context).backgroundColor,
        width: SizeConfig.width,
        padding:
            EdgeInsets.only(left: Constants.paddingLeft, top: 10, bottom: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
    );
  }
}
