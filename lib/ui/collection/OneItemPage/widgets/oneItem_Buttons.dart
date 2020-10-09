import 'package:flutter/material.dart';
import 'package:init_project/utils/size_config.dart';

class OneItemButtons extends StatelessWidget {
  final VoidCallback addCartTap;
  final VoidCallback buyNowTap;
  OneItemButtons({this.addCartTap, this.buyNowTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Quantity',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                width: 25,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: RaisedButton(
                  onPressed: addCartTap,
                  color: Theme.of(context).buttonColor,
                  child: Text(
                    'Add to Cart',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                flex: 1,
                child: RaisedButton(
                  onPressed: addCartTap,
                  color: Theme.of(context).buttonColor,
                  child: Text(
                    'Buy Now',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
