// import 'package:canwinn_project/domain/repositories/auth_repository.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';

// class LoginController extends GetxController {
//   final LoginRepository loginRepository = LoginRepository();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   RxBool isLoading = false.obs;

//   void loginUsers() async {
//     isLoading.value = true;

//     Map<String, dynamic> data = {
//       "email": emailController.text.trim(),
//       "password": passwordController.text.trim(),
//     };
//     try {
//       final response = await loginRepository.loginApi(data);
//       print("Login Success: $response");
//       // Navigate ya token store karo yahan
//     } catch (e) {
//       print("Login Failed: $e");
//       Get.snackbar("Error", e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
