import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constants/color_constants.dart';
import '../Constants/font_constants.dart';

class HospitalDetailsScreen extends StatefulWidget {
  const HospitalDetailsScreen({super.key});

  @override
  State<HospitalDetailsScreen> createState() => _HospitalDetailsScreenState();
}

class _HospitalDetailsScreenState extends State<HospitalDetailsScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackGroundColor,
      appBar: AppBar(
        backgroundColor: BackGroundColor,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Hospital Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                HospitalDetailImage,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),

            // Hospital Info Card
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("🏥 ABC Hospital", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 8),
                    const Wrap(
                      spacing: 8,
                      children: [
                        Text("📍 2.1 km"),
                        Text("⭐ 4.4"),
                        Text("🕒 Open 24×7"),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Wrap(
                      spacing: 8,
                      children: [
                        Text("🏳️ Type: Private"),
                        Text("🛏️ Beds: 15"),
                        Text("💊 Pharmacy: Yes"),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(color: Colors.grey.shade400),
                              ),
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.directions, color: Colors.black),
                            label: const Text("Get Direction"),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.call, color: Colors.white),
                            label: const Text("Call Now", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on, color: Colors.black),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "Address: Schotest, Ansal Corporate Plaza, Palam vihar, Gurgaon, Hariyana",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Text("Senior Doctors", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),

            // Doctor List
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDoctorTile("Dr. Jyoti", "Surgeon"),
                _buildDoctorTile("Dr. Shaym", "Surgeon"),
                _buildDoctorTile("Dr. Deepshikha", "Surgeon"),
              ],
            ),

            const SizedBox(height: 20),
            const Text("Image Gallery", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),

            // Gallery
            SizedBox(
              height: 85,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, index) => ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    child: Image.asset(InteriorImage),
                    width: 100,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.circle, size: 8, color: Colors.purple),
                SizedBox(width: 4),
                Icon(Icons.circle_outlined, size: 8, color: Colors.grey),
                SizedBox(width: 4),
                Icon(Icons.circle_outlined, size: 8, color: Colors.grey),
              ],
            ),

            const SizedBox(height: 20),
            const Text("Reviews", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),

            // Review Card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(child: Image.asset(Doctor)),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tejpal", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("8 years ago"),
                        ],
                      ),
                      const Spacer(),
                      const Row(
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Icon(Icons.star, size: 16, color: Colors.amber),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Emergency call logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.phone, color: Colors.white),
              label: const Text("Emergency Call 102", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorTile(String name, String title) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(ProfilePhoto),
          backgroundColor: Colors.grey[300],
        ),
        const SizedBox(height: 6),
        Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
