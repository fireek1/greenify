import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:blur/blur.dart';
import 'package:soft_edge_blur/soft_edge_blur.dart';

class BottomMenu extends StatelessWidget {
  final int isActive;
  const BottomMenu({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 126,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(51),
                  color: Color(0x05000000),
                ),
                padding: EdgeInsets.all(2),
                child: Row(
                  children: [
                    ButtonMenu(buttonType: 'plants', isActive: isActive == 0),
                    SizedBox(width: 2),
                    ButtonMenu(buttonType: 'search', isActive: isActive == 1),
                    SizedBox(width: 2),
                    ButtonMenu(buttonType: 'user', isActive: isActive == 2),
                  ],
                ),
              ).frosted(blur: 39, borderRadius: BorderRadius.circular(51)),
              SizedBox(width: 6),
              ButtonMenu(buttonType: 'camera', isActive: isActive == 3).frosted(
                padding: EdgeInsets.all(2),
                blur: 39,
                frostColor: Color.fromARGB(255, 180, 180, 180),
                frostOpacity: 0.1,
                borderRadius: BorderRadius.circular(51),
              ),
            ],
          ),
        ),
        // SoftEdgeBlur(
        //   edges: [
        //     EdgeBlur(
        //       type: EdgeType.topEdge,
        //       size: 126,
        //       sigma: 30,
        //       controlPoints: [
        //         ControlPoint(position: 0, type: ControlPointType.visible),
        //         ControlPoint(position: 1, type: ControlPointType.transparent),
        //       ],
        //     ),
        //   ],
        //   child: SizedBox(),
        // ),
      ],
    );
  }
}

class ButtonMenu extends StatelessWidget {
  final String buttonType;
  final bool isActive;
  const ButtonMenu({
    super.key,
    required this.buttonType,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => print('нажата'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: CircleBorder(),
        padding: EdgeInsets.all(0),
      ),
      child: SvgPicture.asset(
        'assets/images/$buttonType.svg',
        width: 24,
        height: 24,
        color: isActive ? Color(0xFF212023) : Colors.white,
      ).frosted(
        blur: isActive ? 0 : 39,
        padding: EdgeInsets.all(20),
        borderRadius: BorderRadius.circular(51),
        frostColor:
            isActive ? Color(0xFF84BF15) : Color.fromARGB(255, 180, 180, 180),
        frostOpacity: 0.1,
      ),
    );
  }
}
