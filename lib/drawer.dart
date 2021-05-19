import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nike_shoes_app/bottom_bar.dart';
import 'package:nike_shoes_app/controller.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key}) : super(key: key);
  final MyController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.black),
            accountName: const Text("Basha doe"),
            accountEmail: const Text("ID: 5046850"),
            currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? const Color(0xFF0062ac)
                        : Colors.white,
                child: Image.asset(
                  'assets/imgs/nike_logo.png',
                  height: 50,
                )),
          ),
          ListTile(
            onTap: () {
              Get.back();
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (context, animation, ___) {
                        return FadeTransition(
                            opacity: animation,
                            child: BottamBar(
                              currentindex: 1,
                            ));
                      }));
            },
            title: const Text('Home'),
            leading: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20,
            ),
          ),
          ListTile(
            onTap: () {
              Get.back();
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (context, animation, ___) {
                        return FadeTransition(
                            opacity: animation,
                            child: BottamBar(
                              currentindex: 0,
                            ));
                      }));
            },
            title: const Text('Favorites'),
            leading: const Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20,
            ),
          ),
          ListTile(
            onTap: () {
              Get.back();
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (context, animation, ___) {
                        return FadeTransition(
                            opacity: animation,
                            child: BottamBar(
                              currentindex: 2,
                            ));
                      }));
            },
            title: const Text('Profile'),
            leading: const Icon(
              Icons.person,
              color: Colors.black,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20,
            ),
          ),
          ListTile(
            onTap: () {
              Get.back();
            },
            title: const Text('Logout'),
            leading: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
