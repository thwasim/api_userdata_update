import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:task/home/model/getmodel.dart';
import 'package:task/url/url.dart';

class ApiserviceUserDataGet extends Endpoints {
  Future<Datum?> userdataGetFunction() async {
    try {
      log("...ooenterd");
      final response = await Dio().get(
        geturl,
      );
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        return Datum.fromJson(response.data);
      } else {
        log(response.data.toString());
      }
    } on DioError catch (e) {
      log(e.response!.data.toString());
      if (e.error.toString().contains("SocketException")) {
        log("Connection refused !");
        return null;
      }
    }
    return null;
  }
}
