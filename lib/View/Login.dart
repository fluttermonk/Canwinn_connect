import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/font_constants.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/widgets/Custombutton.dart';
import 'package:canwinn_project/View/widgets/Customtext.dart';
import 'package:canwinn_project/View/widgets/Socialbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:canwinn_project/ViewModel/Controller/Auth_controller.dart';
import '../Constants/text_constants.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackGroundColor,
      body:
          
      SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Padding(
              padding:  EdgeInsets.all(20.w),
              child: Column(
                children: [
                  Image.asset(Canwinn,width: 128.29685974121094,height: 168),
                  Text(Signin,
                  style: BoldText,),
                  SizedBox(height: 10.w,),
                  Text(signinstatement,
                    textAlign: TextAlign.center,
                  style: NormalText,),
                  SizedBox(height: 10.w,),
                  CustomTextField(
                      controller:emailController ,
                      obscureText: false,
                      label: email,
                     prefiximage: Image.asset(mailIcon,width: 20,height: 20,),
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return returnmail;
                        }
                        return null;
                      }),
                  SizedBox(height: 10.w,),
                  CustomTextField(
                      controller:passwordController ,
                      obscureText: true,
                      label: password,
                      prefiximage: Image.asset(encryptedIcon,width: 20,height: 20,),
                      suffiximage: Image.asset(visibilityIcon,width: 20,height: 20,),
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return returnpassword;
                        }
                        return null;
                      }),
                  SizedBox(height: 5.w,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(forgotpassword,style: Forgot,),
                    ],
                  ),
                SizedBox(height: 10.h,),
                CustomButton(text:Signin, onPressed: (){
                  Get.toNamed('/Dashboard');
                }
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Expanded(flex:2,child:Divider(
                        color: LineColor,
                        thickness: 1,
                      )),
                      Expanded(flex:1,child: Center(child: Text(or,style: NormalUser,))),
                      Expanded(flex:2,child:Divider(
                        color: LineColor,
                        thickness: 1,
                      )),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Expanded(child: SocialButton(
                        text: google,
                        imagePath: Google,
                        onTap: (){
                        }
                        ,)),
                      SizedBox(width: 10.w,),
                      Expanded(child: SocialButton(
                        text: facebook,
                        imagePath: Facebook,
                        onTap: (){
                        }
                        ,))
                    ],
                  ),
                  SizedBox(height: 60.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(donthave,style: account,),
                      InkWell(
                        onTap: (){
                          Get.toNamed('/Registration');
                        },
                        child: Text(Signup,style:TextStyle(color:BoldTextColor,fontSize: 16.sp)
                        
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
