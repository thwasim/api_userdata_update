import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:task/adduser/provider/adduser.dart';

class CameraGallery {
  static showBottom(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.all(30.0.r),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(70.r)),
              color: Colors.orange,
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.16,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  'Choice Profile Photo',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 35.r, right: 35.r),
                  child: Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          context
                              .read<AddScreenprovider>()
                              .pickImageBoth(ImageSource.camera);
                        },
                        icon: const Icon(Icons.camera, color: Colors.black),
                        label: const Text(
                          'Camera',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 40.r),
                      TextButton.icon(
                        onPressed: () {
                          context
                              .read<AddScreenprovider>()
                              .pickImageBoth(ImageSource.gallery);
                        },
                        icon: const Icon(
                          Icons.image,
                          color: Colors.black,
                        ),
                        label: const Text(
                          'Gallery',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
