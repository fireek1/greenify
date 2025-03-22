class Plant {
  final String plantName;
  final String plantScientificName;
  final String imageUrl;
  final int plantId;

  Plant({
    required this.plantName,
    required this.plantScientificName,
    required this.imageUrl,
    required this.plantId,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      plantName: json['plant_name'],
      plantScientificName: json['plant_scientific_name'],
      imageUrl: json['image_url'],
      plantId: json['plant_id'],
    );
  }
}
