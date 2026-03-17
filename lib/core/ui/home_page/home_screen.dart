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

  final TextEditingController nameControl = TextEditingController();
  final TextEditingController emailControl = TextEditingController();
  final TextEditingController numberControl = TextEditingController();

  late List<Widget> contactList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            contactList.isEmpty
                ? AnimationEmptyWidget()
                : CustomeGridView(list: contactList),

            // AnimationEmptyWidget(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16, bottom: 16),
                child: contactList.length == 6
                    ? DeleteLastItemFloatButton(
                        list: contactList,
                        onTap: () {
                          setState(() {
                            contactList.removeLast();
                          });
                        },
                      )
                    : AddNewContact(emailControl: emailControl,
                  nameControl: nameControl,
                  numberControl: numberControl,
                        list: contactList,
                        onTap: () {
                          setState(() {
                            contactList.add(
                              UserProfile(
                                profileName: nameControl.text,
                                profileEmail: emailControl.text,
                                profileNumber: numberControl.text,
                              ),
                            );
                            nameControl.clear();
                            emailControl.clear();
                            numberControl.clear();
                            Navigator.pop(context);
                          });
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
