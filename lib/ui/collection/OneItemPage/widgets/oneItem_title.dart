import 'package:flutter/material.dart';
import 'package:init_project/utils/constants.dart';
import 'package:init_project/utils/size_config.dart';

class OneItemTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
      width: SizeConfig.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Item Name Comes here XXL',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            String.fromCharCodes(Constants.rupees) + "570",
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
