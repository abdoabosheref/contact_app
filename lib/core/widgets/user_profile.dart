import 'package:contact_app/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utilites/assets.dart';
import '../utilites/color_model.dart';

class UserProfile extends StatefulWidget{

  String profileName ;
  String profileEmail ;
  String profileNumber ;
  String? profileImage ;

  UserProfile({required this.profileName,required this.profileEmail,required this.profileNumber,
  this.profileImage});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(width: 177,height: 286,
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.white,)
      ,child: Stack(
          children: [
            Column(mainAxisSize: .min,
              children: [
                Image.asset(AppImages.profileImage),
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Column(
                    spacing: 4.5,
                    children: [
                      Row(spacing: 8,
                        children: [
                          SvgPicture.asset(AppIcons.email),
                          TextWidget(textColor: AppColor.darkBlue,fontSize:10 ,
                              fontWight:FontWeight.w500 ,textName:widget.profileEmail),
                        ],
                      ),
                      Row(spacing: 8,
                        children: [
                          SvgPicture.asset(AppIcons.call),
                          TextWidget(textColor: AppColor.darkBlue,fontSize:10 ,
                            fontWight:FontWeight.w500 ,textName:widget.profileNumber,),
                        ],),
                      ElevatedButton(onPressed: (){},style:
                      ElevatedButton.styleFrom(backgroundColor: AppColor.red,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)) ),
                          child:
                          Row(spacing: 8,mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppIcons.delete),
                              TextWidget(textColor: AppColor.white,fontSize:10 ,
                                fontWight:FontWeight.w500 ,textName:"Delete",),
                            ],
                          )),
                    ],),
                )


              ],
            ),
            Align(alignment: Alignment.centerLeft,child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),color:AppColor.white,),
                width: 84,height: 34,
                child: Center(
                  child: TextWidget(textColor: AppColor.darkBlue,fontSize:14 ,
                    fontWight:FontWeight.w500 ,textName:widget.profileName,),
                ),
              ),
            ),),
          ]),

    );
  }
}