import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:init_project/locator.dart';
import 'package:init_project/services/api.dart';
import 'package:init_project/services/secure_service.dart';
import 'package:init_project/ui/CartPage/cartPage.dart';
import 'package:init_project/ui/home_content/home_widgets/banner.dart';
import 'package:init_project/ui/home_content/home_widgets/featured_categories.dart';
import 'package:init_project/ui/home_content/home_widgets/grid_categories.dart';
import 'package:init_project/ui/home_content/home_widgets/sq_grid_categories.dart';
import 'package:init_project/utils/constants.dart';
import 'dart:convert';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  var _api = locator<Api>();
  var _secure = locator<SecureService>();

  String demoUrl = Constants.demoUrlRest;
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
  }

  void testApi() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kumtluang'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CartPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FeaturedCategoriesPage(),
              BannerHome(),
              GridSqCollections(blockTitle: 'Most Selling'),
              GridCategories(blockTitle: 'Categories'),
              GridSqCollections(blockTitle: 'New Arrival'),
            ],
          ),
        ),
      ),
    );
  }
}
