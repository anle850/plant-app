import 'package:flutter/material.dart';
import 'package:plant_v1/constants.dart';

import '../widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Constants.primaryColor.withOpacity(.5),
                      width: 5,
                    )),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  backgroundImage: ExactAssetImage('assets/images/profile.jpg'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width * .4,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'An Le',
                          style:
                              TextStyle(color: Constants.blackColor, fontSize: 20),
                        ),
                        Icon(Icons.verified, color: Constants.primaryColor,)

                      ],
                    ),
                    Text('lenguyentrian@gmail.com', style: TextStyle(
                      color: Constants.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w300
                    ),)
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .55,
                width: size.width,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileWidget(icon: Icons.person, title: 'My profile',),
                    ProfileWidget(icon: Icons.settings, title: 'Settings',),
                    ProfileWidget(icon: Icons.notifications, title: 'Notifications',),
                    ProfileWidget(icon: Icons.chat, title: 'Chat',),
                    ProfileWidget(icon: Icons.share, title: 'Share',),
                    ProfileWidget(icon: Icons.logout, title: 'Logout',),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

