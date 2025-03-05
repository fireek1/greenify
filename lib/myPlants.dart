import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const plus = 'assets/images/plus.svg';

class MyPlants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.transparent,
                // side: BorderSide(width: 1.5, color: Color(0x0A212023)),
              ),
              onPressed: () => print('Плюс'),
              child: Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Color(0x0A212023)),
                ),
                child: SvgPicture.asset(
                  plus,
                  width: 13,
                  height: 13,
                  alignment: Alignment.center,
                ),
              ),
            ),
            SizedBox(height: 28),
            Text(
              'Мои растения',
              style: TextStyle(
                fontFamily: 'Playfair',
                fontSize: 34,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Row(),
          ],
        ),
      ),
    );
  }
}
