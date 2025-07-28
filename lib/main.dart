// import 'package:canwinn_project/View/Dashboard.dart';
// import 'package:canwinn_project/View/DcotorInformation.dart';
// import 'package:canwinn_project/View/DoctorAppointment.dart';
// import 'package:canwinn_project/View/Login.dart';
// import 'package:canwinn_project/View/Registration.dart';
// import 'package:canwinn_project/View/Splash.dart';
// import 'package:canwinn_project/View/verify_otp.dart';
// import 'package:canwinn_project/View/widgets/DoctorprofileCrad.dart';
// import 'package:canwinn_project/res/routes/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'View/Ambulance_services.dart';
// import 'View/Bed_availability.dart';
// import 'View/BillPage.dart';
// import 'View/Confirmation_Appointment.dart';
// import 'View/Doctor_profile_screen.dart';
// import 'View/Emergency_Contacts.dart';
// import 'View/Hosptial_nearme.dart';
// import 'View/Offers_page.dart';
// import 'View/Pharamacy_Screen.dart';
// import 'View/view_detail_page.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(360,760),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       child: GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//       getPages: AppRoutes.openRoutes(),
//
//       // getPages: [
//       //   GetPage(name: '/', page: ()=>SplashScreen()),
//       //   GetPage(name: '/Login', page: ()=>LoginScreen()),
//       //   GetPage(name: '/Registration', page: ()=>RegistrationScreen()),
//       //   GetPage(name: '/Otp', page: ()=>VerfiyOtpScreens()),
//       //   GetPage(name: '/Dashboard', page: ()=>Dashboard()),
//       //   GetPage(name: '/DoctorAppointment', page: ()=>DoctorAppointmentScreen()),
//       //   GetPage(name: '/DoctorprofileCards', page: ()=>DoctorsAppointmentPage()),
//       //   GetPage(name: '/Doctor_profile_screen', page: ()=>DoctorProfileScreen()),
//       //   GetPage(name: '/BillPage', page: ()=>ConfirmClinicVisitScreen()),
//       //   GetPage(name: '/Confirmation_Appointment', page: ()=>AppointmentConfirmedScreen()),
//       //   GetPage(name: '/Ambulance_services', page: ()=>AmbulanceServiceScreen()),
//       //   GetPage(name: '/Emergency Contacts', page: ()=>EmergencyContactsScreen()),
//       //   GetPage(name: '/BedAvailability', page: ()=>BedAvailabilityScreen()),
//       //   GetPage(name: '/Pharmacy', page: ()=>PharmacyScreen()),
//       //   GetPage(name: '/hospitalnearme', page: ()=>HospitalListScreen()),
//       //   GetPage(name: '/hospitaldetailoage', page: ()=>HospitalDetailsScreen()),
//       //   GetPage(name: '/offers', page: ()=>OffersScreen()),
//       //
//       //
//       //
//       // ],
//
//     ));
//   }
// }

import 'package:canwinn_project/View/Splash.dart';
import 'package:canwinn_project/helper/storage_helper.dart';
import 'package:canwinn_project/res/localizations/language.dart';
import 'package:canwinn_project/res/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageHelper.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 760),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        getPages: AppRoutes.openRoutes(),
        translations: Language(),
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
      ),
    );
  }
}
