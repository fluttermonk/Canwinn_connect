import 'package:canwinn_project/Constants/font_constants.dart';
import 'package:canwinn_project/View/view_detail_page.dart';
import 'package:canwinn_project/View/widgets/CustomBottomnavigation.dart';
import 'package:canwinn_project/View/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Constants/color_constants.dart';


class HospitalListScreen extends StatefulWidget {
  const HospitalListScreen({Key? key}) : super(key: key);

  @override
  State<HospitalListScreen> createState() => _HospitalListScreenState();
}

class _HospitalListScreenState extends State<HospitalListScreen> {
  int _selectedIndex = 0;

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // TODO: Your GetX navigation logic or action here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackGroundColor,
      appBar: AppBar(
        backgroundColor: BackGroundColor,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: Text(
          "Hospitals near me",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search hospital name or speciality...",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Hospital Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "🏥 ABC Hospital",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        Text("📍 2.1 km"),
                        Text("⭐ 4.4"),
                        Text("🕒 Open 24×7"),
                      ],
                    ),
                    SizedBox(height: 6),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        Text("🏳️ Type: Private"),
                        Text("🛏️ Beds: 15"),
                        Text("💊 Pharmacy: Yes"),
                      ],
                    ),
                    SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: secondaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              Get.to(HospitalDetailsScreen());
                            },
                            icon: Icon(Icons.info_outline,color: Colors.white,),
                            label: Text("View Details", style: Mostly),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              // TODO: Call logic
                            },
                            icon: Icon(Icons.call,color: Colors.white,),
                            label: Text("Call Now", style: Mostly),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Emergency Call Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: Icon(Icons.phone,color: Colors.white,),
              label: Text(
                "Emergency Call 102",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          // Custom Bottom Navigation Bar
          CustomBottomNavBarr(
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() => _selectedIndex = index);

              switch (index) {
                case 0:
                  Get.offAllNamed('/Dashboard');
                  break;
                case 1:
                  Get.toNamed('/Offers');
                  break;
                case 2:
                  Get.toNamed('/Services');
                  break;
                case 3:
                  Get.toNamed('/Account');
                  break;
              }
            },
          ),
        ],
      ),
    );
  }
}
