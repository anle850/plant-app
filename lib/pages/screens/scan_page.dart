import 'package:flutter/material.dart';
import 'package:plant_v1/constants.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants _constants = Constants();


    return Scaffold(
      body: Center(
        child: Stack(
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
                            setState(() {
                              debugPrint('clicked share button');
                              // _plantList[widget.plantId].isFavorated =
                              // !_plantList[widget.plantId].isFavorated;
                            });
                          },
                          icon: const Icon(
                              Icons.share),
                          color: Constants.primaryColor.withOpacity(.8)),
                    )

                  ],
                )),
            Positioned(
              top: 100,
                left: 20,
                right: 20,
                child: Container(
                  height: size.height * .8,
                  width: size.width * .8 ,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/code-scan.png', height: 100 ,),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Text to Scan', style: TextStyle(
                        color: Constants.primaryColor.withOpacity(.8),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),)
                    ],
                  ),

            ))
          ],
        ),
      ),
    );
  }
}
