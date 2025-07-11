import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/Constants/text_constants.dart';
import 'package:canwinn_project/View/Dashboard.dart';
import 'package:canwinn_project/View/Login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/font_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _historyExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:BackGroundColor,
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Profile",style: TextStyle(color: secondaryColor,fontWeight: FontWeight.bold),),
        backgroundColor: BackGroundColor,
        centerTitle: false,

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Tap on profile picture
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(ProfilePhoto),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "John Doe",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "+91 12345890",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          // const SizedBox(width: 4),
                          // Icon(Icons.edit, color: Colors.teal),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Tap on QR code
                    },
                    child: Column(
                      children: [
                        Icon(Icons.qr_code, size: 46),
                        const Text("Code: 1234", style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Profile, Membership, Credits row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIconButton(Icons.person, "Profile", () {
                    // Profile tapped
                  }),
                  _buildIconButton(Icons.card_membership, "Membership", () {
                    // Membership tapped
                  }),
                  _buildIconButton(Icons.credit_card, "My Credits", () {
                    // Credits tapped
                  }),
                ],
              ),

              const SizedBox(height: 20),

              // Become member
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Become Canwinn Member",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Get Started tapped
                    },
                    icon: const Icon(Icons.rocket_launch, size: 16),
                    label: const Text("Get Started"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // History (expandable)
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.history,color:secondaryColor),
                      tileColor: BackGroundColor,
                      title:  Text("History"),
                      trailing: Icon(_historyExpanded ? Icons.expand_less : Icons.expand_more),
                      onTap: () {
                        setState(() {
                          _historyExpanded = !_historyExpanded;
                        });
                      },
                    ),
                    if (_historyExpanded) ...[
                      ListTile(
                        tileColor: BackGroundColor,
                        title: const Text("Booking History"),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // Navigate booking history
                        },
                      ),
                      ListTile(
                        tileColor: BackGroundColor,
                        title: const Text("Payment History"),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // Navigate payment history
                        },
                      ),
                    ]
                  ],
                ),
              ),
              const SizedBox(height: 4),

              // Settings
              _buildTile(Icons.settings, "Settings", () {}),
              _buildTile(Icons.headset_mic, "Help & Support", () {}),
              _buildTile(Icons.payment, "Manage payment methods", () {}),
              _buildTile(Icons.info_outline, "About Canwinn", () {}),

              const SizedBox(height: 16),

              // Refer & Earn
              Container(
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Refer & Earn", style: TextStyle(color: Colors.purple)),
                          const SizedBox(height: 4),
                          const Text(
                            "Amazon voucher worth 10%",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                            ),
                            child: Text("Refer Now",style: Mostly,),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 8),
                    Icon(Icons.card_giftcard, color: Colors.purple, size: 40),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Log out
              GestureDetector(
                onTap: () {
                Get.to(LoginScreen());
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.logout, color: Colors.red),
                      SizedBox(width: 8),
                        Text(
                          "Log Out",
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
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

  Widget _buildIconButton(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: Icon(icon, color: secondaryColor),
          ),
          const SizedBox(height: 4),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildTile(IconData icon, String label, VoidCallback onTap) {
    return Card(
      child: ListTile(
        tileColor: BackGroundColor,
        leading: Icon(icon,color: secondaryColor,),
        title: Text(label),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
