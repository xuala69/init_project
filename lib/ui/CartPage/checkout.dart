import 'package:flutter/material.dart';
import 'package:init_project/utils/constants.dart';
import 'package:init_project/utils/size_config.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String deliveryMethod;

  @override
  void initState() {
    deliveryMethod = "FREE";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: SizeConfig.width,
                color: Theme.of(context).cardColor,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15),
                  child: Text(
                    'Delivery Address',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
              Container(
                width: SizeConfig.width,
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Text(
                      'Lallawmzuala khawlhring' + "," + "A-163,Durtlang",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Mel-5,Aizawl,Mizoram' + "," + "796001",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Phone No: ' + "9774656552",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ),
              Container(
                width: SizeConfig.width,
                color: Theme.of(context).cardColor,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15),
                  child: Text(
                    'Delivery Method',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioListTile(
                      value: 'FREE',
                      subtitle: Text(
                        'Delivery Charge: ' + 'FREE',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      title: Text('FREE'),
                      groupValue: deliveryMethod,
                      onChanged: (value) {
                        setState(() {
                          deliveryMethod = value;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('STANDARD'),
                      value: 'STANDARD',
                      subtitle: Text(
                        'Delivery Charge: ' +
                            String.fromCharCodes(Constants.rupees) +
                            "50",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      groupValue: deliveryMethod,
                      onChanged: (value) {
                        setState(() {
                          deliveryMethod = value;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('EXPEDITED'),
                      value: 'EXPEDITED',
                      subtitle: Text(
                        'Delivery Charge: ' +
                            String.fromCharCodes(Constants.rupees) +
                            "100",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      groupValue: deliveryMethod,
                      onChanged: (value) {
                        setState(() {
                          deliveryMethod = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                child: RaisedButton(
                  onPressed: () {},
                  color: Theme.of(context).buttonColor,
                  child: Text('PROCEED TO PAY'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
