import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_18/Models/api_login_model.dart';
import 'package:pas1_mobile_11pplg2_18/api/api_login_service.dart';


class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginStatus = "".obs;
  var token = "".obs;

  final ApiLoginService _loginService = ApiLoginService();

  Future<void> login(String username, String password) async {
    isLoading.value = true;
    try {
      final ApiLoginModel response = await _loginService.login(username, password);
      if (response.status) {
        loginStatus.value = response.message;
        token.value = response.token;
      } else {
        loginStatus.value = response.message;
      }
    } catch (e) {
      loginStatus.value = "Error: ${e.toString()}";
    } finally {
      isLoading.value = false;
    }
  }
}
