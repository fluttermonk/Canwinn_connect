import 'package:canwinn_project/Constants/font_constants.dart';
import 'package:canwinn_project/View/Service_page.dart';
import 'package:canwinn_project/View/widgets/Custombutton.dart';
import 'package:canwinn_project/View/widgets/bottom_bar.dart';
import 'package:canwinn_project/View/widgets/customdashboard.dart';
import 'package:canwinn_project/View/widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Constants/color_constants.dart';
import '../Constants/text_constants.dart';
import 'Applicance_repair_page.dart';
import 'Hosptial_nearme.dart';
import 'Offers_page.dart';
import 'Profile_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          canWinnConnect,
                          height: 10.sp,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 18.sp,
                      backgroundColor: Colors.white,
                      child: Image.asset(notifications),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(location),
                    Text(
                      " Schotest F-259 Ansal Corporate...",
                      style: TextStyle(
                          color: dashboardTextColor, fontSize: 12.sp),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Tapped on image ");
                      },
                      child: Image.asset(dropDownButton),
                    ),
                  ],
                ),
                SizedBox(height: 12.sp),
                CustomSearchBar(
                  onChanged: (value) {
                    print("Search: $value");
                  },
                ),
                SizedBox(height: 16.sp),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  height: 120,
                  decoration: BoxDecoration(
                    color: bannerColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "UNLOCK Unlimited Offers",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Become a CANWINN Member Today!",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 4),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  tapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                  minimumSize: Size(0, 0),
                                ),
                                child: Text(
                                  "Join",
                                  style: TextStyle(
                                      fontSize: 13, color: boldTextColor),
                                ),
                              ),
                              SizedBox(width: 3),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(200),
                                  ),
                                  tapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                  minimumSize: Size(0, 0),
                                ),
                                child: Image.asset(forwardSign),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 7.sp),
                      Image.asset(
                        joinUs,
                        height: 100.spMax,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.sp),
                Row(
                  children: [
                    Text("Categories", style: categories),
                    SizedBox(width: 2.sp),
                    GestureDetector(
                      onTap: () {
                        print("Pressed");
                      },
                      child: Image.asset(
                        forwardSign,
                        height: 20.sp,
                        width: 20.sp,
                        color: boldTextColor,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5.sp),
                GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2.5,
                  padding: const EdgeInsets.all(6.0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 18.0,
                  crossAxisSpacing: 15.0,
                  children: [
                    CustomServiceCard(
                      title: 'Hospital Near Me',
                      imagePath: hospitalNearMe,
                      onTap: () {
                        Get.to(HospitalListScreen());
                      },
                    ),
                    CustomServiceCard(
                      title: 'Doctor Appointment',
                      imagePath: doctorAppointment,
                      onTap: () {
                        Get.toNamed('/DoctorAppointment');
                      },
                    ),
                    CustomServiceCard(
                      title: 'Appliance Repair',
                      imagePath: applianceRepair,
                      onTap: () {
                        Get.to(ApplianceRepairScreen());
                      },
                    ),
                    CustomServiceCard(
                      title: 'Common Service Center',
                      imagePath: commonService,
                      onTap: () {},
                    ),
                    CustomServiceCard(
                      title: 'Lab Test',
                      imagePath: labTest,
                      onTap: () {},
                    ),
                    CustomServiceCard(
                      title: 'Education Skill Center',
                      imagePath: educationCentre,
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: 10.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 30.sp,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          general,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 50.sp),
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 30.sp,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          beautyAndWellness,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 50.sp),
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 30.sp,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          dinner,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("General Store"),
                    SizedBox(width: 20.sp),
                    Text("Beauty & WellNess"),
                    SizedBox(width: 20.sp),
                    Text("Restaurants"),
                  ],
                ),
                SizedBox(height: 30.sp),
                Container(
                  padding: EdgeInsets.all(16.0),
                  height: 220,
                  width: 412,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('earn_1000'.tr, style: earn100),
                      SizedBox(height: 5.sp),
                      Text('get_a'.tr, style: getaa),
                      SizedBox(height: 5.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child:
                            Text("Refer Now", style: TextStyle(color: white)),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset(
                                refer,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
