import 'package:flutter/material.dart';
import 'package:init_project/ui/collection/collection.dart';
import 'package:init_project/utils/size_config.dart';

class FeaturedCategoriesPage extends StatelessWidget {
  Future<List<Map>> getFeaturedCats() async {
    List<Map> _banners = [
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
    return _banners;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height * 0.15,
      // color: Colors.green[300],
      child: FutureBuilder(
          future: getFeaturedCats(),
          builder: (context, snap) {
            if (snap.hasError) {
              return Container(
                child: Center(
                  child: Text('Error ' + snap.error.toString()),
                ),
              );
            } else if (snap.hasData) {
              List<Map> _dataList = snap.data;
              return SizedBox(
                height: SizeConfig.height * 0.15,
                child: ListView.builder(
                    itemCount: _dataList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          //CollectionPage
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => CollectionPage()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(7),
                          width: SizeConfig.width * 0.22,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.redAccent,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        _dataList[index]['image'],
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  /* child: Image.network(
                                    _dataList[index]['image'],
                                    fit: BoxFit.fill,
                                  ), */
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  _dataList[index]['title'],
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }),
    );
  }
}
