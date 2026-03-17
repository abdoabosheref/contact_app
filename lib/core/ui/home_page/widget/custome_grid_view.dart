import 'package:flutter/material.dart';

class CustomeGridView extends StatelessWidget {

   List<Widget> list ;
   CustomeGridView({required this.list});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount: 2,
        mainAxisSpacing: 10,
        childAspectRatio: 9/15,
        crossAxisSpacing: 10,),
      itemBuilder: (context, index) {
        return list[index] ;
      },);
  }
}
