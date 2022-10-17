import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:task/home/model/getmodel.dart';
import 'package:task/service/get/get.dart';

class HomeProvider with ChangeNotifier {

  Datum? userdata;

  getProfileData() async {
    
    userdata = await ApiserviceUserDataGet().userdataGetFunction();
    log("message");
    log(userdata!.imageBinary.toString());
  
    notifyListeners();
  }
}
