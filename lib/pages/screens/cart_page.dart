import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_v1/pages/widget/plan_widget.dart';

import '../../blocs/plant_cubit.dart';
import '../../constants.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int totals;

    return BlocBuilder<PlantCubit, PlantState>(
      builder: (context, state) {
        totals = state.cartPlants.fold(0, (sum, plant) => sum + plant.price);

        return state.cartPlants.isEmpty
            ? const IsEmpty()
            :
        Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                height: size.height,
                child: Column(
                  children: [
                    Expanded(
                      child:
                      ListView.builder(
                        itemCount: state.cartPlants.length,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          Plant plant = state.cartPlants[index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 4,
                                  child: PlantWidget(
                                plantIndex: plant,
                              )),
                              const SizedBox(width: 10,),
                              Expanded(
                                child:
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  height: 80,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Constants.primaryColor.withOpacity(.1),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.remove_shopping_cart,color: Constants.primaryColor,),
                                    onPressed: () {
                                      context
                                          .read<PlantCubit>()
                                          .toggleCartSelection(plant.plantId);
                                    },
                                  ),
                                ),

                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    // const SizedBox(height: 20,)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          const Divider(
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Totals:',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                r'$' + totals.toString(),
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Constants.primaryColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    )
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
            child: Image.asset('assets/images/add-cart.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Your Selected Plants',
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
