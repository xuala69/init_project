import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile details'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text('Profile Details'),
        ),
      ),
    );
  }
}
