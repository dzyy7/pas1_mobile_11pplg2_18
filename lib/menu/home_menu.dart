import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pas1_mobile_11pplg2_18/PostDetailView.dart';
import 'package:pas1_mobile_11pplg2_18/controller/api_controller.dart';
import 'package:pas1_mobile_11pplg2_18/dashboardpage.dart';
import 'package:pas1_mobile_11pplg2_18/localdatabase.dart';

class HomeMenu extends StatelessWidget {
  final ApiController footballController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Obx(() {
          if (footballController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          }
          return ListView.builder(
            itemCount: footballController.postList.length,
            itemBuilder: (context, index) {
              final post = footballController.postList[index];
        
              return Card(
                color: Colors.transparent,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.blue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: post.strBadge.isNotEmpty
                            ? Image.network(
                                post.strBadge,
                                width: 50,
                                height: 50,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.broken_image, color: Colors.white),
                              )
                            : Icon(Icons.image, color: Colors.white),
                      ),
                      title: Text(
                        post.strTeam,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        post.strStadium,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      trailing: Obx(() => IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: post.isFavorite.value
                                  ? Colors.red
                                  : Colors.grey[500],
                            ),
                            onPressed: () async {
                              post.isFavorite.value = !post.isFavorite.value;
                              if (post.isFavorite.value) {
                                await DatabaseHelper.instance.addFavorite(post);
                              } else {
                                await DatabaseHelper.instance
                                    .removeFavorite(post.strTeam);
                                final postIndex = footballController.postList
                                    .indexWhere((p) => p.strTeam == post.strTeam);
                                if (postIndex != -1) {
                                  footballController.postList[postIndex]
                                      .isFavorite.value = false;
                                }
                              }
                            },
                          )),
                      onTap: () {
                        Get.to(PostDetailView(post: post));
                      },
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
