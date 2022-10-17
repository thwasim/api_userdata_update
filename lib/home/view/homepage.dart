import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:task/adduser/view/adduser.dart';
import 'package:task/custom.dart';
import 'package:task/home/provider/homeprovider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    HomeProvider().getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controllerwatch = context.watch<HomeProvider>();
    return Scaffold(
      backgroundColor: HexColor('#152238'),
      appBar: AppBar(
          backgroundColor: HexColor('#152238'),
          elevation: 0,
          leading: const Icon(null)),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Hello welcome',
                style: GoogleFonts.lobster(
                  fontSize: 60,
                  color: Colors.orange,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: CircleAvatar(
                  radius: 70.r,
                  child: Image.network(
                    controllerwatch.userdata?.imageBinary ??
                        'https://kanji.reader.bz/images/og/630x630/7df63b0e4aaacf157bf36c5552c50dab.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  width: 300.w,
                  height: 200.h,
                  child: Column(
                    children: [
                      KeyValue(
                          title: "User Name :",
                          name:
                              controllerwatch.userdata?.username ?? "Loding.."),
                      KeyValue(
                          title: "Email :",
                          name: controllerwatch.userdata?.email ?? "Loding.."),
                      KeyValue(
                          title: "Mobile Number :",
                          name: controllerwatch.userdata?.mobile ?? "loding.."),
                      KeyValue(
                          title: "Address :",
                          name:
                              controllerwatch.userdata?.address ?? "Loding.."),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const AddUserPage()));
                  },
                  child: Container(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          Text(
                            '  Edite profile',
                            style: GoogleFonts.kanit(
                                fontSize: 22, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
