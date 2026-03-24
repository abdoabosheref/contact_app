
import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File> pickImage () async{
  XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  File image = File(xFile!.path);
  return image ;
}
