import 'package:flutter/material.dart';
import 'package:init_project/locator.dart';
import 'package:init_project/services/api.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _controller = TextEditingController();
  FocusNode _searchNode = FocusNode();
  final _api = locator<Api>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search product'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result =
              await _api.searchProductOnce("POCO M2(Slate Blue,64 GB)");
          print(result.toString());
        },
        child: Icon(Icons.search),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              padding: EdgeInsets.only(left: 5, right: 5, top: 2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).indicatorColor,
                  width: 1,
                ),
              ),
              child: TextField(
                focusNode: _searchNode,
                autofocus: true,
                controller: _controller,
                decoration: InputDecoration(
                  hintText: ' Search products',
                  hintStyle: Theme.of(context).textTheme.headline4,
                  border: InputBorder.none,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Center(
                  child: Text('Search results here'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
