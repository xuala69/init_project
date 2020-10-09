import 'package:flutter/material.dart';
import 'package:init_project/utils/constants.dart';
import 'package:init_project/utils/size_config.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width,
      height: SizeConfig.height * 0.15,
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: SizeConfig.height * 0.15,
            width: SizeConfig.height * 0.15,
            child: Image.network(
              'https://picsum.photos/200',
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Item Name Comes here',
                  style: Theme.of(context).textTheme.headline5,
                  maxLines: 3,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price: ' +
                          String.fromCharCodes(Constants.rupees) +
                          "450",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      'Quantity: ' + "1",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                Text(
                  'in Stock',
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.green,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
