import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import the HomeScreen widget

class ApplicationStatusScreen extends StatelessWidget {
  final List<Map<String, String>> applications; // Holds application data

  const ApplicationStatusScreen(
      {super.key,
      required this.applications}); // Constructor to initialize applications

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Application Status', // Title of the screen
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // Text color
            fontSize: 24, // Increased font size
            shadows: [
              Shadow(
                color: Colors.black54, // Shadow color
                blurRadius: 2.0, // Shadow blur radius
                offset: Offset(1.0, 1.0), // Shadow offset
              ),
            ], // Shadow effect added
          ),
        ),
        centerTitle: true, // Center the title
        backgroundColor: Colors.blueAccent, // App bar background color
        actions: [
          IconButton(
            icon: const Icon(Icons.home), // Home icon button
            onPressed: () {
              // Navigate to home screen
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false, // Remove all previous routes
              );
            },
          ),
        ],
      ),
      body: applications.isEmpty // Check if applications list is empty
          ? const Center(
              child: Text(
                  'No applications submitted yet.'), // Message for no applications
            )
          : ListView.builder(
              itemCount: applications.length, // Number of applications
              itemBuilder: (context, index) {
                final application = applications[index]; // Get application data
                return Card(
                  margin: const EdgeInsets.all(10), // Card margin
                  child: ListTile(
                    title: Text(
                        application['name'] ?? 'No Name'), // Application name
                    subtitle: Text(
                        'Status: ${application['status'] ?? 'Pending'}'), // Application status
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        // Handle edit or delete actions here
                        if (value == 'Edit') {
                          // Navigate to edit screen (to be implemented)
                        } else if (value == 'Delete') {
                          // Handle delete (to be implemented)
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return {'Edit', 'Delete'}.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice, // Popup menu item value
                            child: Text(choice), // Display choice
                          );
                        }).toList(); // Convert choices to list
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
