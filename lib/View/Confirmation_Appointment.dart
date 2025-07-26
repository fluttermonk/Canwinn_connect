import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentConfirmedScreen extends StatelessWidget {
  const AppointmentConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: const Text("Appointment Confirmed ✅"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.help_outline),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Appointment Card
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[100],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.deepPurple),
                      SizedBox(width: 8),
                      Text("Appointment time", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text("Thu, 15 May 12:30 PM", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text("Dr. Vishal Aryan\nBooked for - Prachi Rajpurohit"),
                  const SizedBox(height: 4),
                  const Text("Appointment ID: 1213877463846", style: TextStyle(color: Colors.green)),
                  const SizedBox(height: 8),
                  const Text("Aryan Hospital"),
                  const Text("78, Shiv Puri, Old Railway Road, Gurgaon, Haryana 122932"),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: otpBorderColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    onPressed: () {
                      // Call clinic action
                    },
                    icon: const Icon(Icons.call,color: Colors.white,),
                    label: const Text("Call Clinic",style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text("Need Help ?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            const SizedBox(height: 10),
            const Text(
              "In case you cannot make it for the appointment, please cancel or reschedule the appointment, preferably 2 hours before the scheduled time.",
            ),

            const SizedBox(height: 16),
            _buildHelpTile("Reschedule", Icons.calendar_today, () {
              // Navigate to Reschedule screen
              Get.to(() => const PlaceholderWidget("Reschedule Screen"));
            }),
            _buildHelpTile("Cancel", Icons.cancel_outlined, () {
              Get.to(() => const PlaceholderWidget("Cancel Appointment"));
            }),
            _buildHelpTile("Need help with other issues", Icons.help_outline, () {
              Get.to(() => const PlaceholderWidget("Support"));
            }),

            const Spacer(),

            // Bottom Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[100],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.red,
                    child: Text("P", style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text("In-Clinic Appointment for\nPrachi Rajpurohit"),
                  ),
                  const Text("₹ 700", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHelpTile(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

// Temporary placeholder screen
class PlaceholderWidget extends StatelessWidget {
  final String title;
  const PlaceholderWidget(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}
