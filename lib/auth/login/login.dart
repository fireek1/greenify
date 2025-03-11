import 'package:flutter/material.dart';
import 'package:greenify/auth/elements/back_button.dart';
import 'package:greenify/auth/elements/input.dart';
import 'package:greenify/api_service.dart'; // Предположим, что у вас есть этот файл

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = '';
  String password = '';
  String _errorMessage = '';
  bool _isLoading = false;

  Future<void> _login() async {
    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = 'Пожалуйста, заполните все поля';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      // Вызов API для входа
      final user = await ApiService.login(username, password);

      // Если вход успешен, переходим на другой экран
      Navigator.pushNamed(context, '/home'); // Замените '/home' на ваш экран
    } catch (e) {
      setState(() {
        _errorMessage = 'Ошибка входа: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
                'Войдите в аккаунт',
                style: TextStyle(
                  fontFamily: 'SF-Pro',
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 36),
              InputAuth(
                topText: 'Email',
                hintText: 'Введите почту',
                onChanged: (text) {
                  setState(() {
                    username = text;
                  });
                },
                obscureText: false,
              ),
              SizedBox(height: 16),
              InputAuth(
                topText: 'Пароль',
                hintText: 'Введите пароль',
                onChanged: (text) {
                  setState(() {
                    password = text;
                  });
                },
                obscureText: true,
              ),
              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed:
                    _isLoading ? null : _login, // Блокируем кнопку при загрузке
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(155, 222, 31, 0.7),
                  elevation: 0,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: Center(
                    child: Text(
                      'Войти',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SF-Pro',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 17),
              ElevatedButton(
                onPressed: () => print('Нажата'),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
                child: Container(
                  child: Text(
                    'Забыли пароль?',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  alignment: Alignment.center,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 24),
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
              SizedBox(height: 34),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/register'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF000000),
                  elevation: 0,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: Center(
                    child: Text(
                      'Зарегестрироваться',
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
