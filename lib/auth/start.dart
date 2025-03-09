import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const fullLogo = 'assets/images/fullLogo.svg';
const background = 'assets/images/background.jpg';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(background),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 81, 16, 42),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/fullLogo.svg',
                    width: 181,
                    height: 59,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 2,
                            child: SingButton(
                              text: 'Войти',
                              onPressed: () => print('Войти'),
                            ),
                          ),
                          SizedBox(width: 8),
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 5,
                            child: SingButton(
                              text: 'Зарегистрироваться',
                              onPressed: () => print('Регистрация'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      TextButton(
                        onPressed:
                            () => Navigator.pushNamed(context, '/myPlants'),
                        child: Text(
                          'Продолжить как гость',
                          style: TextStyle(
                            fontFamily: 'SF-Pro',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Продолжая, вы соглашаетесь с Условиями использования и Политикой конфиденциальности.',
                        style: TextStyle(
                          fontFamily: 'SF-Pro',
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SingButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SingButton({required this.text, required this.onPressed, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 17.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(56)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'SF-Pro',
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
