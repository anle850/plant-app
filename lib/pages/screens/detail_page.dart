import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_v1/blocs/plant_cubit.dart';
import 'package:plant_v1/constants.dart';
import 'package:plant_v1/models/plants.dart';
import 'package:plant_v1/pages/screens/home_page.dart';

class DetailPage extends StatelessWidget {
  final int plantId;

  const DetailPage({super.key, required this.plantId});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<PlantCubit, PlantState>(
      builder: (context, state) {
        Plant plant = state.plants[plantId];
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Constants.primaryColor.withOpacity(.1),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                          color: Constants.primaryColor,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Constants.primaryColor.withOpacity(.1),
                        ),
                        child: IconButton(
                            onPressed: () {
                              context
                                  .read<PlantCubit>()
                                  .toggleFavorite(plantId);
                            },
                            icon: Icon(plant.isFavorated == true
                                ? Icons.favorite
                                : Icons.favorite_border),
                            color: Constants.primaryColor.withOpacity(.8)),
                      )
                    ],
                  )),
              Positioned(
                  top: 100,
                  left: 20,
                  right: 20,
                  child: Container(
                    width: size.width * 0.8,
                    height: size.height * 0.8,
                    padding: const EdgeInsets.all(20),
                    child: Stack(
                      // crossAxisAlignment: CrossAxisAlignment,
                      children: [
                        Positioned(
                          left: 0,
                          top: 10,
                          child: SizedBox(
                              height: size.width * .8,
                              child: Image.asset(plant.imageURL)),
                        ),
                        Positioned(
                          top: 10,
                          right: 0,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PlantFeture(
                                  plantFeture: plant.size, title: 'Size'),
                              PlantFeture(
                                  plantFeture: plant.humidity.toString(),
                                  title: 'Humidity'),
                              PlantFeture(
                                  plantFeture: plant.temperature,
                                  title: 'Temperature')
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 80, left: 30, right: 30),
                    height: size.height * .5,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.4),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    plant.plantName,
                                    style: TextStyle(
                                      color: Constants.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    r'$' + plant.price.toString(),
                                    style: TextStyle(
                                      color:
                                          Constants.blackColor.withOpacity(.7),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    plant.rating.toString(),
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Constants.primaryColor,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 30,
                                    color: Constants.primaryColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            plant.description,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Constants.blackColor,
                              fontSize: 18,
                              height: 1.5,
                            ),
                          )
                        ]),
                  ))
            ],
          ),
          floatingActionButton: SizedBox(
            width: size.width * .9,
            height: 50,
            child: Container(
              // margin: EdgeInsets.only(bottom: ),
              child: Row(
                children: [
                  Container(
                      height: 50,
                      width: 50,
                      // margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Constants.primaryColor.withOpacity(.5),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 1),
                              blurRadius: 5,
                              color: Constants.primaryColor.withOpacity(.3),
                            )
                          ]),
                      child: IconButton(
                          onPressed: () {
                            context.read<PlantCubit>().toggleCartSelection(plantId);
                          },
                          icon: Icon(plant.isSelected == false
                              ? Icons.shopping_cart
                              : Icons.remove_shopping_cart),
                          color: Colors.white)),
                  const SizedBox(width: 20),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.7),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 5,
                            color: Constants.primaryColor.withOpacity(.5),
                          )
                        ]),
                    child: const Center(
                      child: Text(
                        'BUY NOW',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}

class PlantFeture extends StatelessWidget {
  final String plantFeture;
  final String title;

  const PlantFeture(
      {super.key, required this.plantFeture, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Constants.blackColor,
            ),
          ),
          Text(
            plantFeture,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Constants.primaryColor,
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }
}
