import 'package:flutter/material.dart';

class OneItemCard extends StatelessWidget {
  final VoidCallback onTap;
  OneItemCard({this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
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
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFFE53935)),
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
      ),
    );
  }
}
