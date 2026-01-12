import 'package:flutter/material.dart';

// Class representing an alert about water scarcity
class Alert {
  final String title; // Title of the alert
  final String description; // Description of the alert
  final List<String> solutions; // List of solutions for the alert

  Alert({
    required this.title,
    required this.description,
    required this.solutions,
  });
}

// Widget for displaying water scarcity alerts and solutions
class WaterScarcityAlertsScreen extends StatelessWidget {
  // Sample alerts data
  final List<Alert> alerts = [
    Alert(
      title: "Water Scarcity Alert - Region A",
      description:
          "Due to prolonged drought, water levels are critically low in Region A.",
      solutions: [
        "Take shorter showers to reduce water usage.",
        "Avoid using the dishwasher until the scarcity alert is lifted.",
        "Use collected rainwater for gardening or cleaning.",
        "Ensure taps are turned off when not in use.",
      ],
    ),
    Alert(
      title: "Water Rationing Alert - Region B",
      description:
          "Temporary water rationing measures are in place for Region B.",
      solutions: [
        "Store water during supply hours for essential needs.",
        "Limit laundry and dishwashing to full loads.",
        "Reduce outdoor water use for plants and landscaping.",
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Water Scarcity Alerts & Solutions', // Updated app name
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24, // Increased font size
            shadows: [
              Shadow(
                color: Colors.black54,
                blurRadius: 2.0,
                offset: Offset(1.0, 1.0), // Shadow effect for title
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent, // App bar color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Notification Section
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.red[100], // Light red background for alerts
              child: Row(
                children: [
                  Icon(Icons.warning, color: Colors.red), // Warning icon
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Critical Alert: Water scarcity is severe. Please conserve water!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red[800]),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Alerts List
            ListView.builder(
              shrinkWrap: true, // Prevents scrolling of the ListView
              physics: NeverScrollableScrollPhysics(),
              itemCount: alerts.length, // Number of alerts
              itemBuilder: (context, index) {
                final alert = alerts[index];
                return Card(
                  margin: EdgeInsets.all(10), // Margin around the card
                  elevation: 6, // Shadow effect for the card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                    side: BorderSide(color: Colors.blueAccent, width: 1),
                  ),
                  child: ExpansionTile(
                    title: Text(alert.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blueAccent)), // Alert title
                    subtitle: Text(alert.description), // Alert description
                    children: alert.solutions
                        .map((solution) => ListTile(
                              leading: Icon(Icons.check,
                                  color:
                                      Colors.green), // Check icon for solutions
                              title: Text(solution), // Solution text
                            ))
                        .toList(), // List of solutions
                  ),
                );
              },
            ),

            // Education Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Did You Know?", // Educational section title
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Water scarcity affects more than 2 billion people worldwide. Reducing water usage is essential for sustainability.",
                style: TextStyle(color: Colors.grey[700]), // Text style
              ),
            ),
            SizedBox(height: 10),

            // Resource Links Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Resources:", // Resources section title
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.link, color: Colors.blueAccent), // Link icon
              title: Text("Visit Water Conservation Site"),
              subtitle: Text("Learn more about conserving water."),
              onTap: () {
                // Implement your URL launcher here
              },
            ),
            ListTile(
              leading: Icon(Icons.link, color: Colors.blueAccent), // Link icon
              title: Text("Local Water Authority Contact"),
              subtitle: Text("Get in touch for more information."),
              onTap: () {
                // Implement your URL launcher here
              },
            ),
            SizedBox(height: 10),

            // Community Initiatives Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Community Initiatives:", // Community initiatives section title
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(Icons.people,
                      color: Colors.blueAccent), // People icon
                  title: Text("Water Conservation Workshops"),
                  subtitle: Text(
                      "Join workshops to learn effective water-saving techniques."),
                  onTap: () {
                    // Implement your onTap function here
                  },
                ),
                ListTile(
                  leading: Icon(Icons.cleaning_services,
                      color: Colors.blueAccent), // Cleaning icon
                  title: Text("Community Clean-Up Drives"),
                  subtitle: Text(
                      "Participate in local clean-up events to protect water sources."),
                  onTap: () {
                    // Implement your onTap function here
                  },
                ),
                ListTile(
                  leading:
                      Icon(Icons.group, color: Colors.blueAccent), // Group icon
                  title: Text("Neighborhood Water Watch"),
                  subtitle: Text(
                      "Volunteer for a local group monitoring water quality."),
                  onTap: () {
                    // Implement your onTap function here
                  },
                ),
              ],
            ),
            SizedBox(height: 20), // Extra space at the bottom
          ],
        ),
      ),
    );
  }
}
