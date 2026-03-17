import 'package:contact_app/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utilites/assets.dart';
import '../utilites/color_model.dart';

class AnimationEmptyWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(height:550,
        child: Column(
          children: [
            SizedBox(
              height: 368,
              width: 368,
              child: ListView(
                children: [Lottie.asset(AppAnime.emptyList)],
              ),
            ),
            TextWidget(
              textColor: AppColor.white,
              fontSize: 20,
              fontWight: FontWeight.w500,
              textName: "There is No Contacts Added Here",
            ),
          ],
        ),
      ),
    );
  }
}