import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:init_project/locator.dart';
import 'package:init_project/services/api.dart';
import 'package:init_project/utils/size_config.dart';

class GeneralInfoPage extends StatefulWidget {
  final String title;
  GeneralInfoPage({@required this.title});

  @override
  _GeneralInfoPageState createState() => _GeneralInfoPageState();
}

class _GeneralInfoPageState extends State<GeneralInfoPage> {
  var _api = locator<Api>();
  int _infoId = 4;

  @override
  void initState() {
    if (widget.title != null) {
      switch (widget.title) {
        case "About Us":
          _infoId = 4;
          break;
        case "Delivery Information":
          _infoId = 6;
          break;
        case "Privacy Policy":
          _infoId = 3;
          break;
        case "Terms and Conditions":
          _infoId = 5;
          break;
        default:
          _infoId = 4;
          break;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _api.getGeneralInfo(_infoId.toString()),
        builder: (context, snap) {
          if (snap.hasError) {
            return Text(
              widget.title,
              style: Theme.of(context).textTheme.bodyText1,
            );
          } else if (snap.hasData) {
            print(snap.data);
            return Html(
              data: snap.data,
            );
          }
          return Container(
            height: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 2,
                  width: SizeConfig.width,
                  child: LinearProgressIndicator(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
