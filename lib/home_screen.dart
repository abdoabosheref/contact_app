import 'package:contact_app/core/utilites/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'core/utilites/color_model.dart';
import 'core/widgets/animation_empty_widget.dart';
import 'core/widgets/text_form_input.dart';
import 'core/widgets/text_widget.dart';
import 'core/widgets/user_profile.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController nameControl =TextEditingController();
  final TextEditingController emailControl =TextEditingController();
  final TextEditingController numberControl =TextEditingController();



  late List<Widget> contactList=[ ];


  @override
  Widget build(BuildContext context) {
    return

      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Scaffold(backgroundColor: Colors.transparent,
        body:
          Stack(
            children: [
              contactList.isEmpty ? AnimationEmptyWidget() :
                  GridView.builder(
                    itemCount: contactList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      childAspectRatio: 9/15,
                      crossAxisSpacing: 10,),
                      itemBuilder: (context, index) {
                        return contactList[index] ;
                      },),
              // AnimationEmptyWidget(),

              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, bottom: 16),
                  child:FloatingActionButton(
                    onPressed: () => showModalBottomSheet(isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            height: 460,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColor.darkBlue,
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(16.0),
                              child: Column(
                                spacing: 16,
                                children: [
                                  Row(
                                    spacing: 8,
                                    children: [
                                      Container(
                                        width: 134,
                                        height: 146,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          border:BoxBorder.all(strokeAlign:1,color:AppColor.white),
                                        ),
                                        child: IconButton(onPressed: (){},
                                          icon:  ListView(
                                            children: [Lottie.asset(AppAnime.addImage)],
                                          ),),

                                      ),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        spacing: 16,
                                        children: [
                                          TextWidget(
                                            textColor: AppColor.white,
                                            fontSize: 20,
                                            fontWight: FontWeight.w500,
                                            textName: 'user name',
                                          ),

                                          Container(
                                            width: 210,
                                            height: 1,
                                            color: Colors.white,
                                          ),

                                          TextWidget(
                                            textColor: AppColor.white,
                                            fontSize: 20,
                                            fontWight: FontWeight.w500,
                                            textName: "example@email.com",
                                          ),

                                          Container(
                                            width: 210,
                                            height: 1,
                                            color: Colors.white,
                                          ),

                                          TextWidget(
                                            textColor: AppColor.white,
                                            fontSize: 20,
                                            fontWight: FontWeight.w500,
                                            textName: "+200000000000",
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    spacing: 9,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      TextFormInput(fieldName: "Enter User Name",textEditControl: nameControl,),
                                      TextFormInput(fieldName: "Enter User E-mail",textEditControl: emailControl,),
                                      TextFormInput(fieldName: "Enter User Number",textEditControl: numberControl,),
                                      SizedBox(
                                        height: 60,
                                        child: ElevatedButton(
                                          onPressed: () {
                                           setState(() {

                                             contactList.add(UserProfile(profileName: nameControl.text, profileEmail: emailControl.text, profileNumber: numberControl.text)) ;
                                             setState(() {
                                               nameControl.clear();
                                               emailControl.clear();
                                               numberControl.clear();
                                               Navigator.pop(context);
                                             });
                                           });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadiusGeometry.all(
                                                Radius.circular(16),
                                              ),
                                            ),
                                          ),
                                          child: TextWidget(
                                            textName: 'Enter User',
                                            fontWight: FontWeight.w300,
                                            fontSize: 20,
                                            textColor: AppColor.darkBlue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    child: Icon(Icons.add, color: AppColor.darkBlue),
                  ),
                ),
              ),
            ],
          ),

      ),
    );
  }
}
