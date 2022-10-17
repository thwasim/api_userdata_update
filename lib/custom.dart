import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType type;
  final String? labeltext;
  final IconData icon;
  final bool val;
  final FormFieldValidator<String>? validator;
  final String? hinttext;

  const CustomTextField({
    Key? key,
    this.val = false,
    required this.icon,
    required this.type,
    this.controller,
    this.labeltext,
    this.validator,
    this.hinttext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        errorStyle: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
        hintText: hinttext,
        prefixIcon: Icon(
          icon,
          color: Colors.orange,
        ),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: type,
      obscureText: val,
      textInputAction: TextInputAction.next,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}

class KeyValue extends StatelessWidget {
  final String title;
  final String name;
  const KeyValue({Key? key, required this.title, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 24, right: 28, top: 15, bottom: 10).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.sp,
              color: HexColor('#152238'),
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.r,
              color: HexColor('#152238'),
            ),
          ),
        ],
      ),
    );
  }
}
