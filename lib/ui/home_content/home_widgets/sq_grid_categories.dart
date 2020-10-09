import 'package:flutter/material.dart';
import 'package:init_project/ui/collection/collection.dart';
import 'package:init_project/ui/ui_helper/home_separator.dart';
import 'package:init_project/utils/size_config.dart';

class GridSqCollections extends StatelessWidget {
  final String blockTitle;
  GridSqCollections({@required this.blockTitle});

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
        HomeSeparator(title: blockTitle),
        Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
              bottom: 5,
              top: 5,
            ),
            child: FutureBuilder(
                future: getCategories(),
                builder: (context, snap) {
                  if (snap.hasError) {
                    return Container(
                      child: Center(
                        child: Text('Error please try again later'),
                      ),
                    );
                  } else if (snap.hasData) {
                    List<Map> collections = snap.data;
                    return GridView.builder(
                      itemCount: collections.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => CollectionPage()));
                          },
                          child: Card(
                            child: GridTile(
                              footer: Container(
                                height: 25,
                                color: Theme.of(context).cardColor,
                                child: Center(
                                  child: Text(
                                    collections[index]['title'],
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                              ),
                              child: Container(
                                /*  decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/placeholder.png'),
                                  ),
                                ), */
                                child: Image.network(
                                  collections[index]['image'] ??
                                      "https://homes.cs.washington.edu/~maazsaf/img/no-logo.jpg",
                                  fit: BoxFit.fill,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(
                                        // backgroundColor: Colors.deepOrange,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Color(0xFFE53935)),
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                              ),
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
