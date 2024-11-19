import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pas1_mobile_11pplg2_18/dashboardpage.dart';
import 'package:pas1_mobile_11pplg2_18/menu/home_menu.dart';
import 'package:pas1_mobile_11pplg2_18/menu/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginPage(),
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeMenu(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => Dashboardpage(),
        ),
      ],
    );
  }
}
