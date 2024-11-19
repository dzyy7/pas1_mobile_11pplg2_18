import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pas1_mobile_11pplg2_18/controller/dashboard_controller.dart';
import 'package:pas1_mobile_11pplg2_18/menu/favorite_menu.dart';
import 'package:pas1_mobile_11pplg2_18/menu/home_menu.dart';
import 'package:pas1_mobile_11pplg2_18/menu/profile_menu.dart';

class Dashboardpage extends StatelessWidget {
  const Dashboardpage({super.key});

  @override
  Widget build(BuildContext context) {
    final Dashboardcontroller dashboardController = Get.put(Dashboardcontroller());

    final List<Widget> menus = [
      HomeMenu(),
      FavoriteMenu(),
      ProfileMenu(),
    ];

    return Obx(() {
      return Scaffold(
        body: menus[dashboardController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: dashboardController.selectedIndex.value,
          onTap: (index) {
            dashboardController.selectedIndex.value = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Profile",
            ),

          ],
        ),
      );
    });
  }
}
