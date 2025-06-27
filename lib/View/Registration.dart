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
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  @override
  State<RegistrationScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<RegistrationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController NumberController = TextEditingController();
  final TextEditingController UsernameController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackGroundColor,
      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                  top: 10,
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                    },child: Image.asset(Backbutton),),width:40,),
             Form(
              key: _key,
              child: Padding(
                padding:  EdgeInsets.all(20.w),
                child: Column(
                  children: [
                    Image.asset(Canwinn,width: 128.29685974121094,height: 168),
                    Text(Signup,
                      style: BoldText,),
                    SizedBox(height: 10.w,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(EnterCode,
                        textAlign: TextAlign.center,
                        style: NormalText,),
                    ),
                    SizedBox(height: 10.w,),
                    CustomTextField(
                        controller:UsernameController ,
                        obscureText: false,
                        label: username,
                        prefiximage: Image.asset(Account,width: 20,height: 20,),
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return returnusername;
                          }
                          return null;
                        }),
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
                        controller:NumberController ,
                        obscureText: false,
                        label: number,
                         // prefiximage: Image.asset(mailIcon,width: 20,height: 20,),
                        prefiximage: Icon(Icons.phone,color: NormalTextColor,),
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return returnnumber;
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

                    SizedBox(height: 20.h,),
                    CustomButton(text:Signup, onPressed: (){
                      // if(_key.currentState!.validate()){
                      //
                      // }
                      Get.toNamed('/Otp');
                    }),
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
                    SizedBox(height: 20.h,),
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
                  ],
                ),
              ),
            ),

          ],
          ),
        ),
      ),
    );
  }
}
