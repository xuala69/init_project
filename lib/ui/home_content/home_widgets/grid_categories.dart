import 'package:flutter/material.dart';
import 'package:init_project/locator.dart';
import 'package:init_project/services/api.dart';
import 'package:init_project/ui/collection/collection.dart';
import 'package:init_project/ui/ui_helper/home_separator.dart';
import 'package:init_project/utils/size_config.dart';

class GridCategories extends StatelessWidget {
  // final _navi = locator<NavigationService>();
  final String blockTitle;
  GridCategories({@required this.blockTitle});

  final _api = locator<Api>();

  Future getCategories() async {
    /* if(blockTitle==BlockTitle.baby){}
    else if(){} */
    List<Map> _categories = [
      {
        'title': 'Sports',
        'image': 'https://picsum.photos/300',
      },
      {
        'title': 'Cooking',
        'image': 'https://picsum.photos/200',
      },
      {
        'title': 'Fitness',
        'image': 'https://picsum.photos/350',
      },
      {
        'title': 'Baby',
        'image': 'https://picsum.photos/150',
      },
      {
        'title': 'Cosmetics',
        'image': 'https://picsum.photos/600/300',
      },
      {
        'title': 'Personal Care',
        'image': 'https://picsum.photos/400',
      },
      {
        'title': 'Stationery',
        'image': 'https://picsum.photos/200/200',
      },
      {
        'title': 'Furniture',
        'image': 'https://picsum.photos/300/300',
      },
    ];
    await Future.delayed(Duration(seconds: 1));
    return _categories;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        HomeSeparator(title: 'Categories'),
        Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
              bottom: 5,
              top: 5,
            ),
            child: FutureBuilder(
                future: _api.getAllStores(),
                builder: (context, snap) {
                  if (snap.hasError) {
                    print("error " + snap.error.toString());
                    return Container(
                      child: Center(
                        child: Text('Error please try again'),
                      ),
                    );
                  } else if (snap.hasData) {
                    List<Map> collections = snap.data;
                    return Container(
                      child: Text(" data " + collections.toString()),
                    );
                    //TODO  category lak dan tur
                    return GridView.builder(
                      itemCount: collections.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => CollectionPage()));
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            // color: Colors.red,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SizedBox(
                                  width: SizeConfig.width * 0.24,
                                  height: SizeConfig.width * 0.24,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      collections[index]['image'] ??
                                          "https://homes.cs.washington.edu/~maazsaf/img/no-logo.jpg",
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      collections[index]['title'],
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container(
                    width: SizeConfig.width,
                    height: SizeConfig.height * 0.5,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }))
      ],
    );
  }
}
