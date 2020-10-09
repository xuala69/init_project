import 'package:flutter/material.dart';
import 'package:init_project/ui/CartPage/checkout.dart';
import 'package:init_project/utils/size_config.dart';

class GotoCheckoutBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width,
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CheckoutPage(),
            ),
          );
        },
        child: Text('PROCEED TO CHECKOUT'),
      ),
    );
  }
}
