import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/font_constants.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/widgets/Custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class VerfiyOtpScreens extends StatefulWidget {
  const VerfiyOtpScreens({super.key});

  @override
  State<VerfiyOtpScreens> createState() => _VerfiyOtpScreensState();
}

class _VerfiyOtpScreensState extends State<VerfiyOtpScreens> {
    final TextEditingController otpController = TextEditingController();


    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Color(0xFF000000), 
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF674FA3)), 
        borderRadius: BorderRadius.circular(12),
      ),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: BackGroundColor,
      appBar: AppBar(
         backgroundColor: BackGroundColor,
        leading: IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: SafeArea(child: Padding( padding:  EdgeInsets.all(20.w),
            child:Column(
            children: [
            Image.asset(Canwinn,width: 128.29685974121094,height: 168),
            SizedBox(height: 20.w,),
        Text('Enter OTP Code',
          style: BoldText,),
        Center(
          child: Text(
            'OTP code has been sent to \n (+91) 6377824837.',
            textAlign: TextAlign.center,
            style: NormalText,
          ),
        ),
        SizedBox(height: 10,),
        
        Pinput(
          controller: otpController,
          length: 5,
          keyboardType: TextInputType.number,
          defaultPinTheme: defaultPinTheme,
          onCompleted: (pin) {
          },
        ),
        SizedBox(height: 20,),
        CustomButton(text: "Verify", onPressed: () {
        },),
        SizedBox(height: 10,),
        Row(
            children: [
            Text("Didn’t get OTP? "),
            TextButton(
        onPressed: () {
        
        },
        child: Text("Resend OTP"),
            ),
          ],
        )
        
             
             ],
         ))),
      ),
      );
  }
}
