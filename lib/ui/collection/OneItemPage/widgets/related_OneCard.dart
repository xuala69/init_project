import 'package:flutter/material.dart';
import 'package:init_project/utils/size_config.dart';

class OneItemRelatedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height * 0.2,
      width: SizeConfig.height * 0.2,
      padding: EdgeInsets.only(left: 10, top: 10),
      child: GridTile(
        footer: Container(
          height: 25,
          color: Theme.of(context).cardColor,
          child: Center(
            child: Text(
              'Item Name',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
        child: Container(
          child: Image.network(
            "https://picsum.photos/200/300?grayscale",
            fit: BoxFit.fill,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  // backgroundColor: Colors.deepOrange,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE53935)),
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes
                      : null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
