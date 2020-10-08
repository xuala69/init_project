import 'package:flutter/material.dart';
import 'package:init_project/ui/home_content/home_widgets/banner.dart';
import 'package:init_project/ui/home_content/home_widgets/featured_categories.dart';
import 'package:init_project/ui/home_content/home_widgets/grid_categories.dart';
import 'package:init_project/ui/home_content/home_widgets/sq_grid_categories.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
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
            mainAxisSize: MainAxisSize.max,
            children: [
              FeaturedCategoriesPage(),
              BannerHome(),
              GridSqCollections(
                blockTitle: 'Most Selling',
              ),
              GridCategories(
                blockTitle: 'Categories',
              ),
              GridSqCollections(
                blockTitle: 'New Arrival',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
