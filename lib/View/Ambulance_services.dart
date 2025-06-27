import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/widgets/Bottomsheet_ambulance.dart';
import 'package:flutter/material.dart';

class AmbulanceServiceScreen extends StatefulWidget {
  @override
  _AmbulanceServiceScreenState createState() => _AmbulanceServiceScreenState();
}

class _AmbulanceServiceScreenState extends State<AmbulanceServiceScreen> {
  final List<String> ambulanceOptions = [
    'Basic Life Support',
    'Advanced Life Support',
    'ICU Ambulance',
    'Neonatal Ambulance'
  ];

  String? selectedAmbulance;
  bool showAmbulanceImage = true;
  bool isTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackGroundColor,
      appBar: AppBar(
        backgroundColor: BackGroundColor,
        leading: BackButton(),
        title: const Text('Ambulance Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView( // changed from Column to ListView for better scrolling
          children: [
            Row(
              children: [
                Icon(Icons.location_pin, color: Colors.red),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Schotest F-259 Ansal Corporate Plaza...',
                    style: TextStyle(color: Colors.purple),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 16),

            // Ambulance Dropdown
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ExpansionTile(
                initiallyExpanded: isTileExpanded,
                title: Text('Ambulance Options'),
                onExpansionChanged: (expanded) {
                  setState(() {
                    isTileExpanded = expanded;
                  });
                },
                children: ambulanceOptions.map((option) {
                  return ListTile(
                    title: Text(option),
                    onTap: () {
                      setState(() {
                        selectedAmbulance = option;
                        showAmbulanceImage = false;
                        isTileExpanded = false; // Collapse dropdown
                      });
                    },
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            // Conditional Content
            if (showAmbulanceImage) ...[
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      Siren,
                      height: 100,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Choose an ambulance type above to\nget started.',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ] else ...[
              // Ambulance card appears immediately after selection
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("🚑 ABC Ambulance Services", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Spacer(),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            Text("4.5", style: TextStyle(fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text("Fare: ₹450  |  ETA: 10 mins", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_pin, size: 18, color: Colors.red),
                        SizedBox(width: 4),
                        Text("Location: 2.3 km away", style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              showBookingBottomSheet(context);
                            },
                            icon: Icon(Icons.arrow_forward),
                            label: Text("Book Now", style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Call logic here
                            },
                            icon: Icon(Icons.call),
                            label: Text("Call Now", style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
