import 'package:canwinn_project/View/Dashboard.dart';
import 'package:canwinn_project/View/Offers_page.dart';
import 'package:canwinn_project/View/Profile_page.dart';
import 'package:canwinn_project/View/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constants/color_constants.dart';
import '../Constants/image_constants.dart'; // Make sure you have your images defined here


class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        elevation: 0,
        title: const Text(
          'Services',
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.notifications, color: Colors.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location
            Row(
              children: const [
                Icon(Icons.location_on, color: Colors.red),
                SizedBox(width: 6),
                Text(
                  'Schotest F-259 Ansal Corporate Plaza...',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Search
            const TextField(
              decoration: InputDecoration(
                hintText: 'Explore services near you',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Popular Services title
            const Text(
              'Popular Services',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            // Popular Services scrollable
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildServiceCard('Healthcare', wellNessHealthLettring),
                  _buildServiceCard('Appliance Repair', wellNessHealthLettring),
                  _buildServiceCard('Salon', wellNessHealthLettring),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Trending Offers title
            const Text(
              'Trending Offers',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            // Trending Offers List
            _buildOfferCard(
              title: 'Get 20% off Dental Checkups',
              subtitle: 'Get a comprehensive dental checkup at half price. Offer valid for new patients only.',
              label: 'Limited Time',
              image: limitedTime,
            ),
            const SizedBox(height: 12),
            _buildOfferCard(
              title: 'Free Home Repair Consultation',
              subtitle: 'Get a free consultation for any home repair service. No obligation.',
              label: 'New',
              image: freeHomeConsultant,
            ),
            const SizedBox(height: 30),
          ],
        ),
      )
    );
  }

  // Helper: Service Card
  Widget _buildServiceCard(String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        print('$title tapped');
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
        //  color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imagePath,
                height: 90,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  // Helper: Offer Card
  Widget _buildOfferCard({
    required String title,
    required String subtitle,
    required String label,
    required String image,
  }) {
    return GestureDetector(
      onTap: () {
        print('Offer tapped: $title');
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(color: Colors.purple, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
