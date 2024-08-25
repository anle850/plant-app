import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_v1/constants.dart';

import '../../blocs/plant_cubit.dart';
import '../widget/plan_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<PlantCubit, PlantState>(
      builder: (context, state) {
        final listFavoritePlant = state.favoritePlants;
        return listFavoritePlant.isEmpty
            ? const IsEmpty()
            : Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                height: size.height,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.favoritePlants.length,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          Plant plant = state.favoritePlants[index];
                          debugPrint('Logs Favorite page: ${plant.plantId}');
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: PlantWidget(
                                    plantIndex: plant,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color:
                                        Constants.primaryColor.withOpacity(.1),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Constants.primaryColor,
                                    ),
                                    onPressed: () {
                                      context.read<PlantCubit>().toggleFavorite(
                                          plant.plantId);
                                      debugPrint('Click: $plant.plantId');
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}

class IsEmpty extends StatelessWidget {
  const IsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            child: Image.asset('assets/images/favorited.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Your Favorite Plants',
            style: TextStyle(
              color: Constants.primaryColor.withOpacity(.8),
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
