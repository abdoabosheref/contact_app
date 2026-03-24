import 'dart:io';
import 'package:contact_app/core/utilites/validation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../utilites/assets.dart';
import '../../../utilites/color_model.dart';
import '../../../utilites/image_pick.dart';
import '../../../widgets/text_form_input.dart';
import '../../../widgets/text_widget.dart';

class AddNewContact extends StatelessWidget {
  List<Widget> list;
  VoidCallback onTap;
  TextEditingController nameControl;
  TextEditingController emailControl;
  TextEditingController numberControl;
  final ValueNotifier<File?> pickedImage ;

  AddNewContact({
    super.key,
    required this.list,
    required this.onTap,
    required this.numberControl,
    required this.emailControl,
    required this.nameControl,
    required this.pickedImage
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColor.darkBlue,
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: .min,
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
                            border: BoxBorder.all(
                              width: 2,
                              color: AppColor.white,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () async {

                             pickedImage.value = await pickImage();

                            },
                            icon: ValueListenableBuilder(valueListenable: pickedImage,
                              builder: (context, image, child) {
                                if(image != null ) {
                                  return Image.file(
                                    image, fit: BoxFit.cover,);
                                }else{
                                  return LottieBuilder.asset(AppAnime.addImage);
                                }
                              },),
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            // ValueListenableBuilder(
                            //     valueListenable: nameControl,
                            //     builder: (context, name, child) {
                            //       return TextWidget(
                            //         textColor: AppColor.white,
                            //         fontSize: 20,
                            //         fontWight: FontWeight.w500,
                            //         textName: name.text.isEmpty ? "user name" : name.text,
                            //       );
                            //     },),
                            // Container(
                            //   width: 210,
                            //   height: 1,
                            //   color: Colors.white,
                            // ),
                            // TextWidget(
                            //   textColor: AppColor.white,
                            //   fontSize: 20,
                            //   fontWight: FontWeight.w500,
                            //   textName: "example@email.com",
                            // ),
                            // Container(
                            //   width: 210,
                            //   height: 1,
                            //   color: Colors.white,
                            // ),
                            // TextWidget(
                            //   textColor: AppColor.white,
                            //   fontSize: 20,
                            //   fontWight: FontWeight.w500,
                            //   textName: "+200000000000",
                            // ),
                            vLB(controller: nameControl,text:'user name' ),
                            Container(
                              width: 210,
                              height: 1,
                              color: Colors.white,
                            ),
                            vLB(controller: emailControl,text:'example@gmail.com' ),
                            Container(
                              width: 210,
                              height: 1,
                              color: Colors.white,
                            ),
                            vLB(controller: numberControl,text:'01000000000' ),
                          ],
                        ),
                      ],
                    ),
                    Form(
                      key: formState,
                      child: Column(
                        spacing: 9,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormInput(
                            validator: (value) =>validate.nameValidation(value),
                            fieldName: "Enter User Name",
                            textEditControl: nameControl,
                            keyBoardType: TextInputType.name,

                          ),
                          TextFormInput(
                            validator: (value)=>validate.emailValidation(value) ,
                            fieldName: "Enter User E-mail",
                            textEditControl: emailControl,
                            keyBoardType: TextInputType.emailAddress,
                          ),
                          TextFormInput(validator: (value) => validate.phoneValidation(value),
                            fieldName: "Enter User Number",
                            textEditControl: numberControl,
                            keyBoardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 60,
                            child: ElevatedButton(
                              onPressed: onTap,
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
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      child: Icon(Icons.add, color: AppColor.darkBlue),
    );
  }
  ValueListenableBuilder<TextEditingValue> vLB ({ controller, text}){
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        return TextWidget(
          textColor: AppColor.white,
          fontSize: 20,
          fontWight: FontWeight.w500,
          textName: value.text.isEmpty ? text : value.text,
        );
      },);
  }
}

GlobalKey<FormState> formState = GlobalKey();
