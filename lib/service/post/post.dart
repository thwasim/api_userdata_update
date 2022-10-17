import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/adduser/model/postmodel.dart';
import 'package:task/url/url.dart';

class ApiserviceUser extends Endpoints {
  Future userpostfunction(context, GetUserDetalis obj) async {
    Dio dio = Dio();
    try {
      String filename = obj.image!.split('/').last;
      FormData formData = FormData.fromMap(
        {
          "user_id": obj.uid,
          "imageBinary":
              await MultipartFile.fromFile(obj.image!, filename: filename),
          "username": obj.userName,
          "email": obj.email,
          "mobile": obj.number,
          "address": obj.address
        },
      );
      dio.options.contentType = 'multipart/form-data';
      dio.options.headers["Content-Type"] = "multipart/form-data";
      final response = await Dio().patch(
        posturl,
        data: formData,
      );
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            padding: const EdgeInsets.all(19),
            backgroundColor:Colors.purple,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: Text(
              response.data.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
            ),
          ),
        );
        log(response.data.toString());
      }
    } on DioError catch (e) {
      log(e.response!.data.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: const EdgeInsets.all(19),
          backgroundColor: Colors.purple,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Text(
            e.response!.data["detail"].toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
          ),
        ),
      );
      if (e.error.toString().contains("SocketException")) {
        log("Connection refused !");
        return null;
      }
    }
    return null;
  }
}
