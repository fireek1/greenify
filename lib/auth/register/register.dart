import 'package:flutter/material.dart';

import 'package:greenify/auth/elements/back_button.dart';
import 'package:greenify/auth/elements/input.dart';
import 'package:greenify/auth/elements/login_button.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 16, 12, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtonMenu(),
              SizedBox(height: 28, width: double.infinity),
              Text(
                'Создайте аккаунт',
                style: TextStyle(
                  fontFamily: 'SF-Pro',
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 36),
              InputAuth(topText: 'Email', hintText: 'Введите почту'),
              SizedBox(height: 16),
              InputAuth(topText: 'Пароль', hintText: 'Введите пароль'),
              SizedBox(height: 24),
              LoginButton(buttonText: 'Продолжить'),
              SizedBox(height: 57),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.1)),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    child: Text(
                      'или',
                      style: TextStyle(
                        fontFamily: 'SF-Pro',
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.1)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 57),
              ElevatedButton(
                onPressed: () => print('google'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF000000),
                  elevation: 0,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: Center(
                    child: Text(
                      'Продолжить с Google',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontFamily: 'SF-Pro',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => print('apple'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF000000),
                  elevation: 0,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: Center(
                    child: Text(
                      'Продолжить с Apple',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontFamily: 'SF-Pro',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Продолжая, вы соглашаетесь с Условиями использования и Политикой конфиденциальности.',
                      style: TextStyle(
                        fontFamily: 'SF-Pro',
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
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
