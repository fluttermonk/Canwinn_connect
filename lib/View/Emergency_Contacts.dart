import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/font_constants.dart';
import 'package:canwinn_project/View/widgets/Bottomsheet_addEmergencyContacts.dart';
import 'package:canwinn_project/View/widgets/Controller_addEmergencyContact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContactsScreen extends StatelessWidget {
  final contactcontroller =Get.put(EmergencyContactsController());
  final List<Map<String, String>> emergencyContacts = [
    {"title": "Local Police", "phone": "+91 1234567890"},
    {"title": "Fire Department", "phone": "+91 1234567890"},
    {"title": "Nearest Hospital", "phone": "+91 1234567890"},
    {"title": "Child Helpline/ Women Helpline", "phone": "+91 1234567890"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: Text(
          "Emergency Contacts",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Icon(Icons.location_pin, color: Colors.red),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Schotest F-259 Ansal Corporate Plaza...',
                    style: TextStyle(color: primaryColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Obx(()=>ListView.builder(
              itemCount: contactcontroller.emergencyContacts.length,
              itemBuilder: (context, index) {
                final contact = contactcontroller.emergencyContacts[index];
                return ListTile(
                  title: Text(contact['title'] ?? '',style: earn100),
                  subtitle: Text(contact['phone'] ?? ''),
                  trailing: IconButton(
                    icon: Icon(Icons.call, color: Colors.green),
                    onPressed: () {
                      launch("tel:${contact['phone']}");
                    },
                  ),
                );
              },
            ),
          ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(
                    AddContactBottomSheet(),
                    isScrollControlled: true,
                    backgroundColor: backGroundColor,
                  );
                },
                child: Text("Add Personal Emergency Contact",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
