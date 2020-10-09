import 'package:flutter/material.dart';
import 'package:init_project/ui/CartPage/widgets/cartItem.dart';
import 'package:init_project/ui/CartPage/widgets/goto_checkoutBtn.dart';
import 'package:init_project/utils/constants.dart';
import 'package:init_project/utils/size_config.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CartItem();
                },
              ),
              _chargesBuilder('Total:', '1350'),
              _chargesBuilder('Discount:', '50'),
              _chargesBuilder('Delivery Charges:', '50'),
              SizedBox(height: 5),
              Container(
                width: SizeConfig.width,
                padding: EdgeInsets.only(top: 5, bottom: 5),
                height: 0.5,
                color: Theme.of(context).indicatorColor,
              ),
              _chargesBuilder('Grand Total', '1350'),
              GotoCheckoutBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chargesBuilder(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            String.fromCharCodes(Constants.rupees) + amount,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
