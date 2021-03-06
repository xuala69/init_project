import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:init_project/locator.dart';
import 'package:init_project/models/bannerModel.dart';
import 'package:init_project/services/api.dart';
import 'package:init_project/ui/collection/collection.dart';
import 'package:init_project/utils/size_config.dart';

class BannerHome extends StatefulWidget {
  @override
  _BannerHomeState createState() => _BannerHomeState();
}

class _BannerHomeState extends State<BannerHome> {
  Future<List<String>> getBanners() async {
    List<String> _banners = [
      'https://picsum.photos/600/300',
      'https://picsum.photos/600/300',
      'https://picsum.photos/600/300',
      'https://picsum.photos/600/300',
    ];
    await Future.delayed(Duration(seconds: 1));
    return _banners;
  }

  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  var _api = locator<Api>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      height: SizeConfig.height * 0.2,
      child: FutureBuilder(
          future: _api.getSlideshows(),
          builder: (context, snap) {
            if (snap.hasError) {
              return Container(
                child: Center(
                  child: Text('Error ' + snap.error.toString()),
                ),
              );
            } else if (snap.hasData) {
              List data = snap.data["banners"];
              List<BannerModel> bannerList = [];
              data.forEach((element) {
                BannerModel _banner = BannerModel.fromJson(element);
                bannerList.add(_banner);
              });
              List<String> adsImageList = [];
              return Stack(
                children: <Widget>[
                  Container(
                    color: Theme.of(context).backgroundColor,
                    width: double.infinity,
                    child: CarouselSlider(
                        items: bannerList
                            .map(
                              (item) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => CollectionPage()));
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      child: Stack(
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {},
                                            child: Image.network(item.image,
                                                fit: BoxFit.contain,
                                                width: 1000.0),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 2.5,
                            autoPlayInterval: Duration(seconds: 8),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            })),
                  ),
                  Positioned(
                    bottom: 5.0,
                    left: 0.0,
                    right: 0.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: map<Widget>(adsImageList, (index, url) {
                        return Container(
                          width: 5.0,
                          height: 5.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                _current == index ? Colors.white : Colors.grey,
                          ),
                        );
                      }),
                    ),
                  )
                ],
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
