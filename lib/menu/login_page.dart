import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_18/controller/login_controller.dart';
import '../widget/myTextfield.dart';
import '../widget/my_text.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              MyText(
                  hintText: 'Hello',
                  fontSize: 30,
                  colors: Colors.black,
                  fontWeight: FontWeight.bold),
              MyText(hintText: 'Sign In', fontSize: 20, colors: Colors.black),
              const SizedBox(height: 20),
              MyTextField(
                hintText: 'Username',
                controller: usernameController,
                icon: Icons.person_outline,
              ),
              MyTextField(
                hintText: 'Password',
                isPassword: true,
                controller: passwordController,
                icon: Icons.lock_outline,
              ),
              SizedBox(height: 16),
              Obx(() => ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueAccent),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    onPressed: controller.isLoading.value
                        ? null
                        : () async {
                            if (usernameController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: MyText(
                                    hintText: "Nama dan password harus diisi!",
                                    fontSize: 16,
                                    colors: Colors.white,
                                  ),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            } else {
                              await controller.login(usernameController.text,
                                  passwordController.text);
                              final message = controller.loginStatus.value;
                              final isSuccess = message == "Login success";
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: MyText(
                                    hintText: message,
                                    fontSize: 16,
                                    colors: Colors.white,
                                  ),
                                  backgroundColor:
                                      isSuccess ? Colors.green : Colors.red,
                                ),
                              );
                              if (isSuccess) {
                                Get.offNamed('/dashboard');
                              }
                            }
                          },
                    child: controller.isLoading.value
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : MyText(
                            hintText: "Login",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            colors: Colors.white,
                          ),
                  )),
                  const SizedBox(height: 16),
            Center(
              child: MyText(  
                hintText: "Forgot password?",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                colors: const Color.fromARGB(255, 53, 39, 176),
              ),
            ),  
            ]),
      ),
    );
  }
}
