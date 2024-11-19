import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pas1_mobile_11pplg2_18/widget/myImage.dart';
import 'package:pas1_mobile_11pplg2_18/widget/my_text.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 255, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Color.fromARGB(255, 19, 41, 129),
            fontFamily: 'Calistoga',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 254, 255, 255),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyImage(
              imageUrl:
                  'https://i.pinimg.com/564x/93/d6/f5/93d6f51c8076c1649f1a4dc64000bc38.jpg',
              width: 100,
              height: 100,
              radius: 100,
            ),
            SizedBox(height: 20),
            MyText(
                hintText: 'Muhammad Dzaky ',
                fontSize: 25,
                colors: Color.fromARGB(255, 19, 41, 129),
                fontWeight: FontWeight.bold),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                    hintText: 'Aulia Al Ghazam',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    colors: Color.fromARGB(255, 19, 41, 129)),
                Icon(
                  Icons.verified,
                  color: Colors.blue,
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Column(
                  children: [
                    MyText(
                        hintText: 'Followers',
                        fontSize: 18,
                        colors: Color.fromARGB(255, 19, 41, 129)),
                    MyText(
                        hintText: '1M',
                        fontSize: 18,
                        colors: Color.fromARGB(255, 19, 41, 129))
                  ],
                ),
                VerticalDivider(
                  color: Color(0xFFD8E9A8),
                  width: 50,
                ),
                Column(
                  children: [
                    MyText(
                        hintText: 'Following',
                        fontSize: 18,
                        colors: Color.fromARGB(255, 19, 41, 129)),
                    MyText(
                        hintText: '1',
                        fontSize: 18,
                        colors: Color.fromARGB(255, 19, 41, 129))
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 40,
              width: 275,
              padding: const EdgeInsets.fromLTRB(12, 9, 12, 0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 19, 41, 129),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Text(
                "Joined 31 Desember 2021",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 165, 241, 238),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
