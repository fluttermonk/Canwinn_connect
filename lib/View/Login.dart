import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/font_constants.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/widgets/Custombutton.dart';
import 'package:canwinn_project/View/widgets/Customtext.dart';
import 'package:canwinn_project/View/widgets/Socialbutton.dart';
import 'package:canwinn_project/ViewModel/Controller/login_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController=Get.put(LoginController());
  final _key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Padding(
              padding:  EdgeInsets.all(20.w),
              child: Column(
                children: [
                  Image.asset(canWinn,width: 128.29685974121094,height: 168),
                  Text('sign_in'.tr,
                  style: BoldText,),
                  SizedBox(height: 10.w,),
                  Text('sign_in_statement'.tr,
                    textAlign: TextAlign.center,
                  style: normalText,),
                  SizedBox(height: 10.w,),
                  CustomTextField(
                      controller:loginController.emailController ,
                      obscureText: false,
                      label: 'email'.tr,
                     prefiximage: Image.asset(mailIcon,width: 20,height: 20,),
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return 'return_mail'.tr;
                        }
                        return null;
                      }),
                  SizedBox(height: 10.w,),
                  CustomTextField(
                      controller:loginController.passwordController ,
                      obscureText: true,
                      label: 'password'.tr,
                      prefiximage: Image.asset(encryptedIcon,width: 20,height: 20,),
                      suffiximage: Image.asset(visibilityIcon,width: 20,height: 20,),
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return 'return_password'.tr;
                        }
                        return null;
                      }),
                  SizedBox(height: 5.w,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('forgot_password'.tr,style: forgot,),
                    ],
                  ),
                SizedBox(height: 10.h,),
                  CustomButton(
                    text:'sign_in'.tr,
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                         loginController.loginUsers();
                        //authController.loginUser(email: emailController.text.toString(), password:passwordController.text.toString());
                      }
                    },
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Expanded(flex:2,child:Divider(
                        color: lineColor,
                        thickness: 1,
                      )),
                      Expanded(flex:1,child: Center(child: Text('or'.tr,style: normalUser,))),
                      Expanded(flex:2,child:Divider(
                        color: lineColor,
                        thickness: 1,
                      )),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Expanded(child: SocialButton(
                        text: 'google_text'.tr,
                        imagePath: google,
                        onTap: (){
                        }
                        ,)),
                      SizedBox(width: 10.w,),
                      Expanded(child: SocialButton(
                        text: 'facebook'.tr,
                        imagePath: facebook,
                        onTap: (){
                        }
                        ,))
                    ],
                  ),
                  SizedBox(height: 60.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('dont_have'.tr,style:accounts,),
                      InkWell(
                        onTap: (){
                          Get.toNamed('/Registration');
                        },
                        child: Text('sign_up'.tr,style:TextStyle(color:boldTextColor,fontSize: 16.sp)
                        
                        ),
                      )],
                  ),
                        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
