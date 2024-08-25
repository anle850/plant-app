
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:plant_v1/models/plants.dart';

import 'package:equatable/equatable.dart';

part 'plant_state.dart';


class PlantCubit extends Cubit<PlantState> {
  PlantCubit() : super(const PlantState()) {
    loadPlants();
  }

  static final List<Plant> initialPlants = plantList;

  void loadPlants() {
    emit(state.copyWith(
      plants: initialPlants,
      favoritePlants: initialPlants.where((plant) => plant.isFavorated).toList(),
      cartPlants: initialPlants.where((plant) => plant.isSelected).toList(),
    ));
  }

  void toggleFavorite(int plantId) {
    final updatedPlants = state.plants.map((plant) {
      if (plant.plantId == plantId) {
        debugPrint(plant.isFavorated.toString());
        return plant.copyWith(isFavorated: !plant.isFavorated);
      }
      return plant;
    }).toList();

    emit(state.copyWith(
      plants: updatedPlants,
      favoritePlants: updatedPlants.where((plant) => plant.isFavorated).toList(),
    ));
  }

  void toggleCartSelection(int plantId) {
    final updatedPlants = state.plants.map((plant) {
      if (plant.plantId == plantId) {
        return plant.copyWith(isSelected: !plant.isSelected);
      }
      return plant;
    }).toList();

    emit(state.copyWith(
      plants: updatedPlants,
      cartPlants: updatedPlants.where((plant) => plant.isSelected).toList(),
    ));
  }

  List<Plant> getPlantsByCategory(String category) {
    return state.plants.where((plant) => plant.category == category).toList();
  }

}
