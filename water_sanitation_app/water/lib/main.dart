import 'package:flutter/material.dart'; // Import Flutter Material package.
import 'screens/home_screen.dart'; // Import the HomeScreen widget.

void main() {
  runApp(MyApp()); // Entry point of the app; run MyApp widget.
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Water & Sanitation', // App title.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Primary color for the app.
      ),
      home: HomeScreen(), // Set HomeScreen as the starting page.
    );
  }
}
