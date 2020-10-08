import 'package:flutter/material.dart';

class ProfileOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text('Orders'),
        ),
      ),
    );
  }
}
