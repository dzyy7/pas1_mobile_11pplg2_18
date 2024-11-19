
import 'package:flutter/material.dart';
import 'package:pas1_mobile_11pplg2_18/Models/api_model.dart';

class PostDetailView extends StatelessWidget {
  final ApiModel post;  

  const PostDetailView({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 103, 207, 255),
      appBar: AppBar(
        title: Text(post.strTeam,style: TextStyle(color: const Color.fromARGB(255, 142, 214, 233)),),
        backgroundColor: Color.fromARGB(255, 33, 6, 106),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                post.strBadge,
                width: 100,
                height: 100,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.broken_image, size: 100),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'League: ${post.strLeague}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  post.strDescriptionEN,
                  style: TextStyle(fontSize: 16,color: const Color.fromARGB(255, 5, 31, 53)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
