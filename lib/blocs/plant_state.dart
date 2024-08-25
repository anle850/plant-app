part of 'plant_cubit.dart';

class Plant {
  final int plantId;
  final int price;
  final String size;
  final double rating;
  final int humidity;
  final String temperature;
  final String category;
  final String plantName;
  final String imageURL;
  final bool isFavorated;
  final String description;
  final bool isSelected;

  Plant({
    required this.plantId,
    required this.price,
    required this.category,
    required this.plantName,
    required this.size,
    required this.rating,
    required this.humidity,
    required this.temperature,
    required this.imageURL,
    required this.isFavorated,
    required this.description,
    required this.isSelected,
  });

  Plant copyWith({
    bool? isFavorated,
    bool? isSelected,
  }) {
    return Plant(
      plantId: this.plantId,
      price: this.price,
      category: this.category,
      plantName: this.plantName,
      size: this.size,
      rating: this.rating,
      humidity: this.humidity,
      temperature: this.temperature,
      imageURL: this.imageURL,
      isFavorated: isFavorated ?? this.isFavorated,
      description: this.description,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  // factory Plant.fromJson(Map<String, dynamic> json) {
  //   return Plant(
  //     plantId: json['plantId'],
  //     price: json['price'],
  //     category: json['category'],
  //     plantName: json['plantName'],
  //     size: json['size'],
  //     rating: json['rating'].toDouble(),
  //     humidity: json['humidity'],
  //     temperature: json['temperature'],
  //     imageURL: json['imageURL'],
  //     isFavorated: json['isFavorated'],
  //     description: json['description'],
  //     isSelected: json['isSelected'],
  //   );
  // }
}

class PlantState extends Equatable {
  final List<Plant> plants;
  final List<Plant> favoritePlants;
  final List<Plant> cartPlants;
  final bool isLoading;
  final String? error;

  const PlantState({
    this.plants = const [],
    this.favoritePlants = const [],
    this.cartPlants = const [],
    this.isLoading = false,
    this.error,
  });

  PlantState copyWith({
    List<Plant>? plants,
    List<Plant>? favoritePlants,
    List<Plant>? cartPlants,
    bool? isLoading,
    String? error,
  }) {
    return PlantState(
      plants: plants ?? this.plants,
      favoritePlants: favoritePlants ?? this.favoritePlants,
      cartPlants: cartPlants ?? this.cartPlants,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [plants, favoritePlants, cartPlants, isLoading, error];
}