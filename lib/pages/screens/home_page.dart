import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_v1/blocs/plant_cubit.dart';
import 'package:plant_v1/constants.dart';
import 'package:plant_v1/pages/screens/detail_page.dart';

import '../widget/plan_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //Plant category
    List<String> plantTypes = [
      'Recommended',
      'Indoor',
      'Outdoor',
      'Garden',
      'Supplement',
    ];

    String nameCategory = plantTypes[selectedCategory];

    return Scaffold(body: SingleChildScrollView(
      child: BlocBuilder<PlantCubit, PlantState>(
        builder: (context, state) {
          List<Plant> getPlantsByCategory =
              context.read<PlantCubit>().getPlantsByCategory(nameCategory);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  // padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.only(left: 16),
                  width: size.width * .9,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black54.withOpacity(.6),
                      ),
                      const Expanded(
                          child: TextField(
                        showCursor: false,
                        decoration: InputDecoration(
                          hintText: ' Search Plant',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      )),
                      IconButton(
                        onPressed: () => print('clicked mic'),
                        icon: Icon(
                          Icons.mic,
                          color: Colors.black54.withOpacity(.6),
                        ),
                      )
                      // Icon(
                      //   Icons.mic,
                      //   color: Colors.black54.withOpacity(.6),
                      // ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 50,
                width: size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: plantTypes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = index;
                            });
                          },
                          child: Text(
                            plantTypes[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: selectedCategory == index
                                  ? FontWeight.bold
                                  : FontWeight.w300,
                              color: selectedCategory == index
                                  ? Constants.primaryColor
                                  : Constants.blackColor,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              // BlocBuilder<PlantCubit, PlantState>(
              //   builder: (context, state) {
              //     List<Plant> getPlantsByCategory =
              //         context.read<PlantCubit>().getPlantsByCategory(nameCategory);
              //
              //     return
              //   },
              // )
              SizedBox(
                height: size.height * .3,
                child: ListView.builder(
                    itemCount: getPlantsByCategory.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      int plantId = getPlantsByCategory[index].plantId;
                      Plant plant = state.plants[plantId];
                      debugPrint('Log: $plantId');

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: DetailPage(plantId: plantId),
                                  type: PageTransitionType.bottomToTop));
                        },
                        child: Container(
                          width: 200,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Constants.primaryColor.withOpacity(.6),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 10,
                                  right: 20,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        context
                                            .read<PlantCubit>()
                                            .toggleFavorite(plantId);
                                        debugPrint('Click favorite button $plantId');
                                      },
                                      icon: Icon(plant.isFavorated == true
                                          ? Icons.favorite
                                          : Icons.favorite_border),
                                      color: Constants.primaryColor
                                          .withOpacity(.8),
                                      iconSize: 25,
                                    ),
                                  )),
                              Positioned(
                                  left: 50,
                                  right: 50,
                                  top: 50,
                                  bottom: 50,
                                  child: Image.asset(plant.imageURL)),
                              Positioned(
                                  left: 15,
                                  bottom: 20,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        plant.category,
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        plant.plantName,
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )),
                              Positioned(
                                  bottom: 15,
                                  right: 20,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      r'$' + plant.price.toString(),
                                      style: TextStyle(
                                        color: Constants.primaryColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                padding: const EdgeInsets.only(left: 16),
                child: const Text(
                  'New Plants',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),

              PlantListWidget(plantList: state.plants),
            ],
          );
        },
      ),
    ));
  }
}
