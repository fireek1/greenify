import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blur/blur.dart';
import 'package:greenify/api_service.dart';
import 'package:greenify/models/plants.dart';

const points = 'assets/images/points.svg';
const lamp = 'assets/images/light.svg';
const cloud = 'assets/images/cloud.svg';
const plant = 'assets/images/plant.svg';

class MyPlantScroll extends StatelessWidget {
  Future<List<Plant>> fetchPlants() async {
    return await ApiService.getPlants();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Plant>>(
      future: fetchPlants(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Ошибка: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Нет данных'));
        } else {
          final plants = snapshot.data!;
          return Column(
            children:
                plants
                    .map(
                      (plant) => MyPlantsCard(
                        name: plant.plantName,
                        scientificName: plant.plantScientificName,
                        light:
                            100, // Замените на реальные данные, если они есть
                        water:
                            100, // Замените на реальные данные, если они есть
                        urlImage: plant.imageUrl,
                      ),
                    )
                    .toList(),
          );
        }
      },
    );
  }
}

class MyPlantsCard extends StatelessWidget {
  final String name;
  final String scientificName;
  final int light;
  final int water;
  final String urlImage;

  const MyPlantsCard({
    super.key,
    required this.name,
    required this.scientificName,
    required this.light,
    required this.water,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(32)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.network(
              urlImage,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Ваши кнопки и иконки
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => print('Плюс'),
                      child: Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Center(
                          child: SvgPicture.asset(points, width: 6, height: 20),
                        ),
                      ).frosted(
                        blur: 3,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(plant, width: 22, height: 22),
                      ),
                    ).frosted(
                      blur: 3,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontFamily: 'SF-Pro',
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          scientificName,
                          style: TextStyle(
                            fontFamily: 'SF-Pro',
                            color: Color.fromRGBO(255, 255, 255, 0.9),
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
