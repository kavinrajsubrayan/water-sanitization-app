import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Importing the FlChart package for charts

// Stateless widget for the Community Impact Dashboard
class CommunityImpactDashboard extends StatelessWidget {
  // Static data for demonstration purposes
  final int waterborneIllnessCasesReduced =
      150; // Cases reduced due to initiatives
  final int totalWaterborneIllnessCases =
      1000; // Total waterborne illness cases for calculation
  final int cleanWaterDeliveries = 200; // Number of clean water deliveries
  final int totalWaterConserved = 5000; // Total water conserved in liters
  final int communityReach = 1200; // Total households reached

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Community Impact Dashboard', // Title of the screen
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24, // Increased font size for the title
            shadows: [
              Shadow(
                color: Colors.black54,
                blurRadius: 2.0,
                offset: Offset(1.0, 1.0), // Shadow effect for depth
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent, // AppBar background color
      ),
      body: SingleChildScrollView(
        // Allows scrolling of the content
        padding: const EdgeInsets.all(16.0), // Padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title Section
            Text(
              "Community Impact Summary",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent, // Title color
              ),
            ),
            SizedBox(height: 20), // Space between sections

            // Pie chart for Waterborne Illness Reduction
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the container
                borderRadius: BorderRadius.circular(10), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5, // Shadow effect for the container
                  ),
                ],
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 20), // Vertical padding
              child: Column(
                children: [
                  SizedBox(
                    height: 220, // Fixed height for the pie chart
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: waterborneIllnessCasesReduced.toDouble(),
                            title:
                                '$waterborneIllnessCasesReduced', // Display value
                            color: Colors.blue[400]!, // Color for reduced cases
                            titleStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                            ),
                          ),
                          PieChartSectionData(
                            value: totalWaterborneIllnessCases -
                                waterborneIllnessCasesReduced.toDouble(),
                            title:
                                '${totalWaterborneIllnessCases - waterborneIllnessCasesReduced}', // Display remaining cases
                            color: const Color.fromARGB(
                                255, 255, 32, 32)!, // Color for remaining cases
                            titleStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Space below the pie chart
                  Text(
                    "Reduction in Waterborne Illness Cases",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Reduced Cases: $waterborneIllnessCasesReduced",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Remaining Cases: ${totalWaterborneIllnessCases - waterborneIllnessCasesReduced}",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),

            SizedBox(height: 20), // Space between sections

            // Progress Bar for Clean Water Deliveries
            _buildCleanWaterDeliveriesSection(), // Call method to build section

            SizedBox(height: 20), // Space between sections

            // Cards for Total Water Conserved and Community Reach
            ImpactCard(
              title: "Total Water Conserved", // Title for card
              value: "$totalWaterConserved L", // Value displayed in card
              description:
                  "Liters saved through conservation efforts", // Description for card
              onTap: () => _showDetailedView(
                  context,
                  'Water Conservation Details',
                  totalWaterConserved), // Navigate on tap
            ),
            ImpactCard(
              title: "Community Reach",
              value: "$communityReach",
              description: "Households impacted by clean water services",
              onTap: () => _showDetailedView(context, 'Community Reach Details',
                  communityReach), // Navigate on tap
            ),
          ],
        ),
      ),
    );
  }

  // Function to build Clean Water Deliveries section
  Widget _buildCleanWaterDeliveriesSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the container
        borderRadius: BorderRadius.circular(10), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5, // Shadow effect for the container
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0), // Padding around the content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Clean Water Deliveries",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8), // Space below the title
          Text(
            "This represents the number of clean water deliveries made to the community, ensuring access to safe drinking water. It's crucial for reducing waterborne diseases and promoting health.",
            style: TextStyle(
                fontSize: 14, color: Colors.grey[700]), // Description text
          ),
          SizedBox(height: 8), // Space below the description
          LinearProgressIndicator(
            value: cleanWaterDeliveries /
                1000, // Assuming 1000 as max for progress bar
            backgroundColor: Colors.grey[300], // Background color for progress
            color: Colors.green[400], // Color for progress indicator
          ),
          SizedBox(height: 4), // Space below the progress bar
          Text(
            "$cleanWaterDeliveries deliveries", // Number of deliveries
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  // Method to navigate to detailed view screen
  void _showDetailedView(BuildContext context, String title, int value) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
            title: title, value: value), // Navigate to detail screen
      ),
    );
  }
}

// Reusable widget for each impact card
class ImpactCard extends StatelessWidget {
  final String title; // Title of the card
  final String value; // Value displayed on the card
  final String description; // Description of the card
  final VoidCallback onTap; // Callback function for tap action

  ImpactCard({
    required this.title,
    required this.value,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Detect tap on the card
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10), // Margin for card
        elevation: 4, // Elevation for shadow effect
        color: Colors.white, // Card background color
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding inside the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title, // Card title
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8), // Space below the title
              Text(
                value, // Value displayed on the card
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.blue[400], // Color for the value
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4), // Space below the value
              Text(
                description, // Description of the card
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700], // Color for description text
                ),
              ),
              SizedBox(height: 10), // Space below the description
              // Row for View More Button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: onTap, // Navigate on button press
                    child: Text(
                      "View More", // Button text
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;
  final int value;

  DetailScreen({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    // Example historical data
    List<int> historicalData = [
      value,
      value + 50,
      value + 100,
      value + 150,
      value + 200,
    ];

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView for scrolling
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Graph section
            SizedBox(
              height: 300, // Set a fixed height for the graph
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: true),
                  minX: 0,
                  maxX: 4,
                  minY: 0,
                  maxY: value + 250,
                  lineBarsData: [
                    LineChartBarData(
                      spots: historicalData
                          .asMap()
                          .entries
                          .map((e) =>
                              FlSpot(e.key.toDouble(), e.value.toDouble()))
                          .toList(),
                      isCurved: true,
                      color: Colors.blue[400]!,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Analysis of $title",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(height: 8),
            Text(
              "This graph shows the historical data for $title over the last few months. The values represent the number of $title impacted through community water initiatives.",
              style: TextStyle(
                  fontSize: 16, color: Colors.black87), // Brightened text color
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue[200]!, width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Current Value:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Brightened text color
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "$value",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[600],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Historical Data:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Brightened text color
                    ),
                  ),
                  ...historicalData.map(
                    (data) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${historicalData.indexOf(data) + 1} Month(s) Ago:",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87), // Brightened text color
                          ),
                          Text(
                            "$data",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
