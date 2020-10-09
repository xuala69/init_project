import 'package:flutter/material.dart';
import 'package:init_project/ui/collection/OneItemPage/widgets/related_OneCard.dart';
import 'package:init_project/utils/size_config.dart';

class OneItemRelated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height * 0.2,
      width: SizeConfig.width,
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return OneItemRelatedCard();
        },
      ),
    );
  }
}
