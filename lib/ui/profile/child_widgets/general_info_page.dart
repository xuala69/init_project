import 'package:flutter/material.dart';

class GeneralInfoPage extends StatelessWidget {
  final String title;
  final String contents;
  GeneralInfoPage({this.title, this.contents});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text(
            contents,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
