import 'package:contact_app/core/utilites/assets.dart';
import 'package:contact_app/core/utilites/color_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'core/ui/home_page/home_screen.dart';

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late List<Widget> contactList=[ ];
  @override
  Widget build(BuildContext context) {

    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: AppColor.darkBlue,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(backgroundColor: AppColor.darkBlue,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(left: 26.0,top:24 ),
              child: SvgPicture.asset(AppImages.routeLogo,
                alignment:Alignment.topLeft ,
                width: 117,height: 39,),
            )

        ),
        body: HomeScreen(),




      ),

    );
  }
}