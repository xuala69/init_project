import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'headline6',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            'headline1',
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            'headline2',
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            'headline3',
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            'headline4',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            'headline5',
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            'bodyText1',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'bodyText2',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            'subtitle1',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            'subtitle2',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
