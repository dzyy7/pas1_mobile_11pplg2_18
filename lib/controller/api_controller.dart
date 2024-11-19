import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_18/Models/api_model.dart';
import 'package:pas1_mobile_11pplg2_18/api/api_service.dart';



class ApiController extends GetxController {
  var isLoading = true.obs;
  var postList = <ApiModel>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await ApiService().fetchPosts();
      postList.assignAll(posts);
    } finally {
      isLoading(false);
    }
  }
}
