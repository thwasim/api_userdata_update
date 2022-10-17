import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:task/adduser/view/imagepick.dart';
import 'package:task/custom.dart';
import 'package:task/home/provider/homeprovider.dart';
import '../provider/adduser.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({Key? key}) : super(key: key);

  static int? id;
  @override
  Widget build(BuildContext context) {
    final controllerwatch = context.watch<HomeProvider>();
    final controller = context.watch<AddScreenprovider>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('#152238'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Text(
                  'Hello',
                  style: GoogleFonts.lobster(
                    fontSize: 60,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  'Please Create a User',
                  style: GoogleFonts.lobster(
                    fontSize: 20,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      child: Image.network(
                        controllerwatch.userdata?.imageBinary ??
                            'https://kanji.reader.bz/images/og/630x630/7df63b0e4aaacf157bf36c5552c50dab.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          CameraGallery.showBottom(context);
                        },
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.orange,
                        )),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Form(
                    child: CustomTextField(
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'Field is required';
                      //   } else if (value.length < 4) {
                      //     return 'Username should be 4 digit';
                      //   }
                      //   return null;
                      // },

                      icon: Icons.person,
                      type: TextInputType.name,
                      hinttext: 'username',
                      controller: controller.usernamecontroller,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Form(
                    child: CustomTextField(
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'Field is required';
                      //   } else if (!RegExp(
                      //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      //       .hasMatch(value)) {
                      //     return 'Enter a valid email Address';
                      //   }
                      //   return null;
                      // },
                      icon: Icons.email,
                      type: TextInputType.emailAddress,
                      hinttext: 'email',
                      controller: controller.emailcontroller,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Form(
                    child: CustomTextField(
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'Field is required';
                      //   } else if (!RegExp(
                      //           r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{7,}$')
                      //       .hasMatch(value)) {
                      //     return 'Password is 1 UpperCase Alphabet and 1 Special Character and Numeric';
                      //   }
                      //   return null;
                      // },
                      icon: Icons.phone,
                      type: TextInputType.name,
                      hinttext: 'phone number',
                      controller: controller.phonecontroller,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Form(
                    child: CustomTextField(
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'Field is required';
                      //   }
                      //   return null;
                      // },
                      icon: Icons.home_filled,
                      type: TextInputType.name,
                      hinttext: 'address',
                      controller: controller.addresscontroller,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      context.read<AddScreenprovider>().userDataPostFunction(
                          context, AddUserPage.id.toString());
                    },
                    child: Container(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(child: Consumer<AddScreenprovider>(
                        builder: (context, value, child) {
                          return value.isLoading == true
                              ? const Center(child: CircularProgressIndicator())
                              : Text(
                                  'submit',
                                  style: GoogleFonts.kanit(
                                      fontSize: 22, color: Colors.white),
                                );
                        },
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
