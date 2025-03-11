import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String buttonText;
  const LoginButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(155, 222, 31, 0.7),
        elevation: 0,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 58,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'SF-Pro',
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
