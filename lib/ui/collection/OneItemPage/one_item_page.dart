import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:init_project/ui/collection/OneItemPage/widgets/oneItem_Buttons.dart';
import 'package:init_project/ui/collection/OneItemPage/widgets/oneItem_description.dart';
import 'package:init_project/ui/collection/OneItemPage/widgets/oneItem_related.dart';
import 'package:init_project/ui/collection/OneItemPage/widgets/oneItem_title.dart';
import 'package:init_project/ui/ui_helper/home_separator.dart';
import 'package:init_project/utils/size_config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OneItemPage extends StatefulWidget {
  final String itemId;
  OneItemPage({this.itemId});
  @override
  _OneItemPageState createState() => _OneItemPageState();
}

class _OneItemPageState extends State<OneItemPage> {
  String itemId;
  List<String> adsImageList = [
    'https://picsum.photos/400/200',
    'https://picsum.photos/500/300',
    'https://picsum.photos/500/250',
    'https://picsum.photos/300/200',
    'https://picsum.photos/300/250',
  ];

  int _current = 0;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.itemId != null) {
      itemId = widget.itemId;
    }
    _controller.text = '1';
    super.initState();
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kumtluang'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _imageCarousel(),
              OneItemTitle(),
              OneItemDescription(),
              _buttons(),
              SizedBox(
                height: 5,
              ),
              HomeSeparator(title: 'Related Products'),
              OneItemRelated(),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttons() {
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
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(
                width: 25,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 30,
                      height: 30,
                      child: Icon(
                        MdiIcons.minus,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Center(
                      child: TextField(
                        controller: _controller,
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 30,
                      height: 30,
                      child: Icon(
                        Icons.add,
                      ),
                    ),
                  ),
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
                  onPressed: () {},
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
                  onPressed: () {},
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

  Widget _imageCarousel() {
    return Container(
      width: SizeConfig.width,
      height: SizeConfig.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            color: Theme.of(context).backgroundColor,
            width: double.infinity,
            child: CarouselSlider(
                items: adsImageList
                    .map((item) => GestureDetector(
                          onTap: () {
                            /* Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => CollectionPage())); */
                          },
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                child: Stack(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {},
                                      child: Image.network(item,
                                          fit: BoxFit.cover, width: 1000.0),
                                    ),
                                    //asdasd
                                    //asdaaaaaaa
                                    Positioned(
                                      bottom: 0.0,
                                      left: 0.0,
                                      right: 0.0,
                                      child: Container(
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
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 20.0),
                                        child: Text(''),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.5,
                    autoPlayInterval: Duration(seconds: 8),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
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
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.white : Colors.grey,
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
