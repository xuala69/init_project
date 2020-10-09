import 'package:flutter/material.dart';
import 'package:init_project/utils/size_config.dart';

class OneItemDescription extends StatelessWidget {
  final String lorem = r"""
   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed tristique augue. Praesent commodo ipsum eget ex dictum tristique. Aliquam lobortis dui vel libero tincidunt faucibus. Mauris pulvinar mi arcu, at interdum turpis interdum non. Etiam aliquet volutpat consequat. Praesent diam quam, hendrerit id lectus sit amet, viverra condimentum mi. Curabitur fringilla, tortor sit amet pharetra vulputate, orci ligula luctus enim, in lacinia ex tortor a felis. Nullam feugiat dolor erat, vel auctor nibh pellentesque nec. Nullam non dictum augue, vitae tincidunt turpis. Etiam eget auctor justo, in suscipit ex. Duis hendrerit tincidunt risus, ornare consectetur mauris iaculis non. In id interdum eros. Vivamus elementum luctus diam, a facilisis magna tincidunt quis. Mauris rutrum felis et interdum volutpat. Vestibulum gravida ullamcorper sem ac suscipit. Aliquam orci lacus, pulvinar a faucibus luctus, posuere et magna.

Pellentesque sed varius odio. In non felis interdum, gravida massa et, lacinia odio. Donec id ornare lorem, sed viverra nulla. Nulla dapibus maximus orci eget tincidunt. Proin fermentum venenatis efficitur. Nullam lacinia tempor quam, sit amet pharetra neque placerat id. Suspendisse vitae consectetur lacus. Pellentesque non condimentum turpis. 
  """;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      width: SizeConfig.width,
      child: Text(
        lorem,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
