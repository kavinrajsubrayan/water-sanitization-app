import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'service_application_screen.dart'; // Import the application screen for service applications

class SanitationServicesScreen extends StatelessWidget {
  // List of available sanitation services
  final List<String> services = [
    'Water Quality Testing',
    'Maintenance of Water Filtration Systems',
    'Wastewater Treatment Monitoring',
    'Mobile Water Delivery Services',
    'Water Storage Tank Maintenance',
    'Emergency Water Supply',
  ];

  // List of icons corresponding to each service
  final List<IconData> serviceIcons = [
    Icons.local_drink, // Icon for Water Quality Testing
    Icons.settings, // Icon for Maintenance of Water Filtration Systems
    Icons.monitor, // Icon for Wastewater Treatment Monitoring
    Icons.delivery_dining, // Icon for Mobile Water Delivery Services
    Icons.storage, // Icon for Water Storage Tank Maintenance
    Icons.emergency, // Icon for Emergency Water Supply
  ];

  // List of colors for the service icons
  final List<Color> iconColors = [
    Colors.blueAccent, // Color for Water Quality Testing
    Colors.orange, // Color for Maintenance of Water Filtration Systems
    Colors.red, // Color for Wastewater Treatment Monitoring
    Colors.green, // Color for Mobile Water Delivery Services
    Colors.yellow, // Color for Water Storage Tank Maintenance
    Colors.purple, // Color for Emergency Water Supply
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sanitation Services', // Title of the screen
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24, // Increased font size for the title
            shadows: [
              Shadow(
                color: Colors.black54,
                blurRadius: 2.0, // Shadow blur radius
                offset: Offset(1.0, 1.0), // Shadow offset
              ),
            ], // Added shadow effect for the title
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent, // AppBar background color
        actions: [
          IconButton(
            icon: const Icon(Icons.home), // Home icon button
            onPressed: () {
              // Navigate back to the home screen
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false, // Remove all previous routes
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.lightBlue[50], // Background color for the body
        child: ListView.builder(
          itemCount: services.length, // Number of services to display
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(10), // Margin around each card
              elevation: 6, // Elevation for shadow effect
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12), // Rounded corners for the card
              ),
              child: ListTile(
                leading: Icon(
                  serviceIcons[index], // Icon for the service
                  size: 40, // Size of the icon
                  color: iconColors[index], // Color of the icon
                ),
                title: Text(
                  services[index], // Name of the service
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold, // Bold font for the service name
                  ),
                ),
                trailing: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: const Color.fromARGB(
                          255, 34, 130, 255), // Button border color
                      width: 2, // Reduced border width
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 2, vertical: 4), // Button padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Rounded button corners
                    ),
                  ),
                  child: Text(
                    'Apply', // Text on the button
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color.fromARGB(
                          255, 0, 0, 0), // Button text color
                    ),
                  ),
                  onPressed: () {
                    // Navigate to the service application screen with the selected service name
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServiceApplicationScreen(
                          serviceName:
                              services[index], // Pass the selected service name
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
