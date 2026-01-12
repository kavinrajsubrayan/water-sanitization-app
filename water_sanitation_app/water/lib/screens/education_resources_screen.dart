import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EducationResourcesScreen extends StatelessWidget {
  EducationResourcesScreen({Key? key}) : super(key: key);

  // List of educational resources with title, description, link, and type (article or video)
  final List<Map<String, String>> resources = [
    {
      'title': 'Understanding Water Quality',
      'description': 'An article on the basics of water quality management.',
      'link':
          'https://www.tandfonline.com/doi/full/10.1080/07900627.2019.1670506',
      'type': 'article'
    },
    {
      'title': 'Sanitation Best Practices',
      'description': 'A video tutorial on effective sanitation methods.',
      'link': 'https://example.com/sanitation-video',
      'type': 'video'
    },
    {
      'title': 'Waterborne Diseases Prevention',
      'description':
          'An article covering the prevention of waterborne diseases.',
      'link': 'https://example.com/disease-prevention',
      'type': 'article'
    },
    {
      'title': 'Sustainable Water Solutions',
      'description': 'An educational video on sustainable water practices.',
      'link': 'https://example.com/sustainable-water-solutions',
      'type': 'video'
    },
    {
      'title': 'Innovative Water Technologies',
      'description': 'Explore the latest technologies for water purification.',
      'link': 'https://example.com/innovative-water-tech',
      'type': 'article'
    },
  ];

  // Function to open a resource link in the default browser
  void _openResource(String url) async {
    final Uri uri = Uri.parse(url); // Parse the URL
    // Check if the URL can be launched and launch it
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url'; // Error handling if the URL cannot be launched
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Education Resources', // Title of the screen
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24, // Font size for the title
            shadows: [
              Shadow(
                color: Colors.black54,
                blurRadius: 2.0,
                offset: Offset(1.0, 1.0),
              ),
            ], // Added shadow effect for better visibility
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent, // AppBar color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue[50], // Light blue background
                borderRadius: BorderRadius.circular(10), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    offset: Offset(0, 3), // Shadow effect
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore Our Educational Resources", // Header title
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800], // Header text color
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Learn more about water quality, sanitation, and health through our curated articles and videos.",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700]), // Subtitle style
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Resource List: Articles and Videos
            ..._buildResourceSections('Articles', 'article'),
            ..._buildResourceSections('Videos', 'video'),
          ],
        ),
      ),
    );
  }

  // Function to build sections for articles and videos
  List<Widget> _buildResourceSections(
      String sectionTitle, String resourceType) {
    // Filter resources based on type (article or video)
    final filteredResources = resources
        .where((resource) => resource['type'] == resourceType)
        .toList();

    return [
      Text(
        sectionTitle, // Title of the section (Articles or Videos)
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[800]),
      ),
      SizedBox(height: 10),
      // Map through filtered resources and create cards for each
      ...filteredResources.map((resource) {
        return Card(
          margin:
              EdgeInsets.symmetric(vertical: 10), // Vertical margin for cards
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Rounded corners for cards
          ),
          elevation: 4, // Card elevation for shadow
          child: ListTile(
            leading: Icon(
              resourceType == 'video'
                  ? Icons.play_circle_outline // Icon for video resources
                  : Icons.article, // Icon for article resources
              color: Colors.blue,
              size: 40,
            ),
            title: Text(
              resource['title']!, // Title of the resource
              style: TextStyle(fontWeight: FontWeight.bold), // Title style
            ),
            subtitle:
                Text(resource['description']!), // Description of the resource
            trailing: IconButton(
              icon: Icon(Icons.open_in_new), // Icon for opening resource link
              onPressed: () => _openResource(
                  resource['link']!), // Open resource link on press
            ),
          ),
        );
      }).toList(),
      SizedBox(height: 20), // Add spacing between sections
    ];
  }
}
