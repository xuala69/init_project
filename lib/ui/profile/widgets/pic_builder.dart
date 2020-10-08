import 'package:flutter/material.dart';
import 'package:init_project/utils/size_config.dart';

class PicBuilder extends StatelessWidget {
  final String mUser;
  PicBuilder({this.mUser});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width,
      height: SizeConfig.height * 0.3,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: SizeConfig.width * 0.15,
            backgroundImage: NetworkImage(
              'https://picsum.photos/200',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'userName',
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }
}
