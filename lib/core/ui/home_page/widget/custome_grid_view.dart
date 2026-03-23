import 'package:flutter/material.dart';

import '../../../widgets/user_profile.dart';

class CustomeGridView extends StatefulWidget {

   List<Widget> list ;


   CustomeGridView({required this.list,});

  @override
  State<CustomeGridView> createState() => _CustomeGridViewState();
}

class _CustomeGridViewState extends State<CustomeGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount: 2,
        mainAxisSpacing: 10,
        childAspectRatio: 9/15,
        crossAxisSpacing: 10,),
      itemBuilder: (context, index) {
        return widget.list[index] ;

      },);
  }
}
