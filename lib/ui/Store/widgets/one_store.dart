import 'package:flutter/material.dart';
import 'package:init_project/ui/collection/collection.dart';
import 'package:init_project/utils/size_config.dart';

class OneStore extends StatelessWidget {
  final String storeName;
  final String image;
  OneStore({this.storeName, this.image});
  @override
  Widget build(BuildContext context) {
    return Card(
      // height: SizeConfig.height * 0.3,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => CollectionPage()));
        },
        child: SizedBox(
          width: SizeConfig.width,
          height: SizeConfig.height * 0.2,
          child: Stack(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: SizeConfig.width,
                height: SizeConfig.height * 0.2,
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                      child: Text(
                        storeName,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
