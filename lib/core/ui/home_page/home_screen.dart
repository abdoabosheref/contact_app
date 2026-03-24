import 'dart:io';
import 'package:contact_app/core/ui/home_page/widget/add_new_contact.dart';
import 'package:contact_app/core/ui/home_page/widget/custome_grid_view.dart';
import 'package:contact_app/core/ui/home_page/widget/delete_last_item_float_button.dart';
import 'package:flutter/material.dart';
import '../../widgets/animation_empty_widget.dart';
import '../../widgets/user_profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<File?> pickedImage = ValueNotifier(null);
  final TextEditingController nameControl = TextEditingController();
  final TextEditingController emailControl = TextEditingController();
  final TextEditingController numberControl = TextEditingController();

  late List<Widget> contactList = [];
  @override
  void dispose() {
    nameControl.dispose();
    emailControl.dispose();
    numberControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            contactList.isEmpty
                ? AnimationEmptyWidget()
                : CustomeGridView(list: contactList,
              ),

            // AnimationEmptyWidget(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:  EdgeInsets.only(right: 16, bottom: 16),
                child: contactList.length >= 6
                    ? DeleteLastItemFloatButton(
                        list: contactList,
                        onTap: () {
                          setState(() {
                            contactList.removeLast();
                          });
                        },
                      )
                    : AddNewContact(
                        pickedImage: pickedImage,
                        emailControl: emailControl,
                        nameControl: nameControl,
                        numberControl: numberControl,
                        list: contactList,
                  onTap: () {
                    validationReturnUserProfile ( );
                  },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void validationReturnUserProfile (){
    if (formState.currentState!.validate()) {
      setState(() {
        late UserProfile newContact;
        newContact = UserProfile(
          pickedImage: ValueNotifier<File?>(pickedImage.value),
          profileName: nameControl.text,
          profileEmail: emailControl.text,
          profileNumber: numberControl.text,

          onTap: () {
            setState(() {
              contactList.remove(newContact);
            });
          },
        );
        contactList.add(newContact);
        nameControl.clear();
        emailControl.clear();
        numberControl.clear();
        pickedImage.value = null;
        Navigator.pop(context);
      });
    }
  }
}
