import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  final emailController =TextEditingController();
  final passwordController=TextEditingController();
  void loginUser(){
    String email=emailController.text;
    String password=passwordController.text;
    if(email=="Admin@gmail.com" && password=="admin123"){
      Get.snackbar("Login Success", "Welcome!");
    }
    else{
      Get.snackbar("Login Failed", "Wrong Credentials");
    }
  }
  @override
  void onClose(){
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

}