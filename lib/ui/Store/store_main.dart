import 'package:flutter/material.dart';
import 'package:init_project/ui/Store/widgets/one_store.dart';

class StoreMain extends StatefulWidget {
  @override
  _StoreMainState createState() => _StoreMainState();
}

class _StoreMainState extends State<StoreMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stores'),
        centerTitle: true,
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            OneStore(
              storeName: 'Kumtluang Store',
              image: 'https://picsum.photos/seed/picsum/400/200',
            ),
            OneStore(
              storeName: 'Romawi Furniture',
              image: 'https://picsum.photos/seed/picsum/300/150',
            ),
            OneStore(
              storeName: 'Dinga Auto parts',
              image: 'https://picsum.photos/seed/picsum/400/300',
            ),
            OneStore(
              storeName: 'Kumtluang Store',
              image: 'https://picsum.photos/seed/picsum/500/250',
            ),
            OneStore(
              storeName: 'DS Vestige',
              image: 'https://picsum.photos/seed/picsum/450/200',
            ),
            OneStore(
              storeName: 'Sawmi Baby Essentials',
              image: 'https://picsum.photos/seed/picsum/600/300',
            ),
            OneStore(
              storeName: 'Hminghming pickle',
              image: 'https://picsum.photos/seed/picsum/700/350',
            ),
            OneStore(
              storeName: 'Jack Samsung Enterprise',
              image: 'https://picsum.photos/seed/picsum/400/250',
            ),
          ],
        ),
      )),
    );
  }
}
