import 'package:contact_app/core/utilites/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utilites/color_model.dart';

class DeleteLastItemFloatButton extends StatelessWidget {
  List<Widget> list;
  VoidCallback onTap ;
  DeleteLastItemFloatButton({super.key, required this.list,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColor.red,
      onPressed: onTap ,
      child: SvgPicture.asset(AppIcons.delete,width: 20,),
    );
  }
}
