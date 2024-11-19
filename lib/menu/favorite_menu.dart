import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:pas1_mobile_11pplg2_18/Models/api_model.dart';
import 'package:pas1_mobile_11pplg2_18/controller/api_controller.dart';
import 'package:pas1_mobile_11pplg2_18/localdatabase.dart';
import 'package:pas1_mobile_11pplg2_18/widget/reusablecard.dart';

class FavoriteMenu extends StatefulWidget {
  const FavoriteMenu({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<FavoriteMenu> {
  List<ApiModel> favoriteList = [];

  @override
  void initState() {
    super.initState();
    fetchFavorites();
  }

  Future<void> fetchFavorites() async {
    final favorites = await DatabaseHelper.instance.getFavorites();
    setState(() {
      favoriteList = favorites;
    });
  }

  Future<void> deleteFavorite(String teamName) async {
    await DatabaseHelper.instance.removeFavorite(teamName);
    fetchFavorites(); 
  }

void showDeleteConfirmationDialog(String teamName) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirm Delete"),
        content: Text("Are you sure you want to delete this favorite?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              await deleteFavoriteAndSync(teamName); 
              Navigator.of(context).pop();
            },
            child: Text("Delete"),
          ),
        ],
      );
    },
  );
}

Future<void> deleteFavoriteAndSync(String teamName) async {
  await DatabaseHelper.instance.removeFavorite(teamName);

  final ApiController postController = Get.find();

  final postIndex =
      postController.postList.indexWhere((post) => post.strTeam == teamName);
  if (postIndex != -1) {
    postController.postList[postIndex].isFavorite.value = false;
  }

  fetchFavorites();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favoriteList.isEmpty
          ? Center(
              child: Text("No favorites yet",
                  style: TextStyle(color: Colors.white)))
          : ListView.builder(
              itemCount: favoriteList.length,
              itemBuilder: (context, index) {
                final post = favoriteList[index];
                return ReusableCard(
                  leading: post.strBadge.isNotEmpty
                      ? Image.network(post.strBadge, width: 50, height: 50)
                      : Icon(Icons.image, color: Colors.white),
                  title: post.strTeam,
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => showDeleteConfirmationDialog(post.strTeam),
                  ),
                );
              },
            ),
    );
  }
}
