import 'package:canwinn_project/View/Dashboard.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  Dio _dio = Dio();
  void loginUser({required String email, required String password}) async {

    // if (email.isEmpty || password.isEmpty) {
    //   Get.snackbar("Error", "Please enter both email and password");
    //   return;
    // }

    try {
      final response = await _dio.post(
        "https://connect.electionmaster.in/public/api/login",
        data: {
          "email": email,
          "password": password,
        },
        // options: Options(
        //   headers: {"Content-Type": "application/json"},
        // ),
      );

      if (response.statusCode == 200 || response.statusCode==201) {
        //var data = response.data;
        print("API response Data: ${response.data}");

          Get.snackbar("Login Success", "Welcome!");
          Get.to(Dashboard());
        } else {
          Get.snackbar("Login Failed", response.data["message"] ?? "Invalid credentials");
        }

    } catch (e) {
      Get.snackbar("Error", "Login failed: $e");
    }
  }

}
