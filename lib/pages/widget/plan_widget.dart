import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../blocs/plant_cubit.dart';
import '../../constants.dart';
import '../screens/detail_page.dart';

class PlantListWidget extends StatelessWidget {
  final List plantList;

  // final bool isFull ;

  const PlantListWidget({
    super.key,
    required this.plantList,
    // this.isFull = true,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<PlantCubit, PlantState>(
      builder: (context, state) {
        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: size.height * .5,
            child: ListView.builder(
                itemCount: plantList.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: DetailPage(plantId: plantList[index].plantId),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: PlantWidget(plantIndex: plantList[index]));
                }));
      },
    );
  }
}

class PlantWidget extends StatelessWidget {
  const PlantWidget({
    super.key,
    required this.plantIndex,
  });

  final Plant plantIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Constants.primaryColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 80,
      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
      margin: const EdgeInsets.only(top: 20),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(.6),
                  shape: BoxShape.circle,
                ),
              ),
              Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 80,
                    child: Image.asset(plantIndex.imageURL),
                  )),
              Positioned(
                  left: 80,
                  // bottom: 5,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(plantIndex.category),
                        Text(
                          plantIndex.plantName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Constants.blackColor,
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              r'$' + plantIndex.price.toString(),
              style: TextStyle(
                color: Constants.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
