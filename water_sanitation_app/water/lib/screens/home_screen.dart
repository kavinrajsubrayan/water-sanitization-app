import 'package:flutter/material.dart';
import 'sanitation_services_screen.dart';
import 'education_resources_screen.dart';
import 'community_impact_dashboard.dart';
import 'water_scarcity_alerts_screen.dart';
import 'water_quality_chart.dart';
import 'tips_repository.dart';
import 'application_status_screen.dart'; // Import the ApplicationStatusScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String todayTip; // Variable to hold today's tip
  int _selectedIndex = 0; // To track the selected index of the navigation bar

  @override
  void initState() {
    super.initState();
    todayTip = TipsRepository
        .getTodayTip(); // Retrieve the daily tip from the repository
  }

  // Method to show a dialog with today's tip
  void showTipDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Daily Water Conservation Tip"),
          content: Text(todayTip),
          actions: [
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Close the dialog when "Close" is pressed
              },
            ),
          ],
        );
      },
    );
  }

  // Method to handle navigation when a bottom navigation item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

    // Navigate to the selected screen based on index
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen()), // Stay on HomeScreen
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ApplicationStatusScreen(
                  applications: [])), // Pass applications if needed
        );
        break;
      // Add other cases for different screens as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'H2O Harmony', // Updated app name
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24, // Increased font size
            shadows: [
              Shadow(
                color: Colors.black54,
                blurRadius: 2.0,
                offset: Offset(1.0, 1.0), // Shadow effect for text
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent, // AppBar background color
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlue[100]!,
              Colors.white
            ], // Background gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Card displaying today's tip
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.lightbulb,
                        color: Colors.yellow, size: 40), // Icon for today's tip
                    title: Text(
                      "Today's Tip",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      todayTip,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis, // Handle overflow
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: Icon(Icons.info_outline,
                        color: Colors.blueAccent), // Info icon
                    onTap: showTipDialog, // Show dialog on tap
                  ),
                ),
                SizedBox(height: 8),
                WaterQualityChart(), // Widget to display water quality chart
                SizedBox(height: 16),
                // Section header for quick access
                Text(
                  'Quick Access',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                // GridView for quick access options
                GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), // Prevent scrolling
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.2,
                  ),
                  children: [
                    // Dashboard cards linking to different screens
                    _buildDashboardCard(
                      context,
                      icon: Icons.cleaning_services,
                      label: 'Sanitation Services',
                      screen: SanitationServicesScreen(),
                      color: Colors.green,
                    ),
                    _buildDashboardCard(
                      context,
                      icon: Icons.book,
                      label: 'Education Resources',
                      screen: EducationResourcesScreen(),
                      color: Colors.orange,
                    ),
                    _buildDashboardCard(
                      context,
                      icon: Icons.assessment,
                      label: 'Impact Dashboard',
                      screen: CommunityImpactDashboard(),
                      color: Colors.purple,
                    ),
                    _buildDashboardCard(
                      context,
                      icon: Icons.warning,
                      label: 'Water Scarcity Alerts',
                      screen: WaterScarcityAlertsScreen(),
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // Bottom navigation bar for easy access to main sections
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Application Status',
          ),
        ],
        currentIndex: _selectedIndex, // Highlight selected index
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped, // Handle item tap
      ),
    );
  }

  // Helper method to build dashboard cards
  Widget _buildDashboardCard(BuildContext context,
      {required IconData icon,
      required String label,
      required Widget screen,
      required Color color}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => screen), // Navigate to the selected screen
        );
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: color), // Icon for the card
              SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
