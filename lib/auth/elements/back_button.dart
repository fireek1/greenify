import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const back = 'assets/images/back.svg';

class BackButtonMenu extends StatelessWidget {
  const BackButtonMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 58,
        height: 58,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 1.5, color: Color(0x0A212023)),
        ),
        child: Center(child: SvgPicture.asset(back, width: 25, height: 25)),
      ),
    );
  }
}
