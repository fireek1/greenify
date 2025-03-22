import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenify/main_menu/bottom_menu.dart';
import 'package:greenify/main_menu/my_plants/my_plant_scroll.dart';

const plus = 'assets/images/plus.svg';

class MyPlants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16, width: double.infinity),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () => print('Плюс'),
                    child: Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.5,
                          color: Color(0x0A212023),
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(plus, width: 20, height: 20),
                      ),
                    ),
                  ),
                  SizedBox(height: 28),
                  Text(
                    'Мои растения',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Playfair',
                      fontSize: 34,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  MyPlantScroll(),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomMenu(isActive: 0),
            ),
          ],
        ),
      ),
    );
  }
}
