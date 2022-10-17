import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task/adduser/model/postmodel.dart';
import 'package:task/service/post/post.dart';

class AddScreenprovider with ChangeNotifier {
  bool isLoading = false;
  File? imagefile;

  pickImageBoth(source) async {
    log("1");
    XFile? image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTempray = File(image.path);

    imagefile = imageTempray;
    notifyListeners();
    log(imagefile.toString());
  }

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();

  void userDataPostFunction(BuildContext context, String value) {
    ApiserviceUser().userpostfunction(
      context,
      GetUserDetalis(
        userName: usernamecontroller.text,
        email: emailcontroller.text,
        number: phonecontroller.text,
        image: imagefile!.path.toString(),
        address: addresscontroller.text,
      ),
    );
  }
}
