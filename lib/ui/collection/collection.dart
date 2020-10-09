import 'package:flutter/material.dart';
import 'package:init_project/ui/collection/OneItemPage/one_item_page.dart';
import 'package:init_project/ui/collection/widgets/one_item_card.dart';
import 'package:init_project/utils/size_config.dart';

class CollectionPage extends StatefulWidget {
  final String collectionId;
  final String collectionName;
  CollectionPage({this.collectionId, this.collectionName});
  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  String collectionId;
  String collectionName;
  @override
  void initState() {
    if (widget.collectionId != null) {
      collectionId = widget.collectionId;
      collectionName = widget.collectionName;
    }
    collectionName = 'Cosmetics';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          collectionName,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: SizeConfig.width,
        height: SizeConfig.height,
        child: GridView.builder(
          itemCount: 30,
          shrinkWrap: true,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return OneItemCard(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OneItemPage(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
