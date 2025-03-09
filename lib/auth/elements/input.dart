import 'package:flutter/material.dart';

class InputAuth extends StatelessWidget {
  final String topText;
  final String hintText;
  const InputAuth({super.key, required this.topText, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topText,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'SF-Pro',
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: 'SF-Pro',
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(0, 0, 0, 0.15),
              fontSize: 16,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 24),
            filled: true,
            fillColor: Color.fromRGBO(0, 0, 0, 0.05),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(22),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 0.2),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(22),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        ),
      ],
    );
  }
}
