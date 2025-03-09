import 'package:flutter/material.dart';

class MyPlantScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MyPlantsCard extends StatelessWidget {
  final String name;
  final int light;
  final int water;

  const MyPlantsCard({
    super.key,
    required this.name,
    required this.light,
    required this.water,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(children: [Row(), Container()]),
          Row(),
        ],
      ),
    );
  }
}
