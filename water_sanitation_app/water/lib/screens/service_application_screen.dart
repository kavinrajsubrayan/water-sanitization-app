import 'package:flutter/material.dart';
import 'application_status_screen.dart'; // Importing the application status screen

// A list to store submitted applications
List<Map<String, String>> applications = [];

class ServiceApplicationScreen extends StatefulWidget {
  final String serviceName; // The name of the service being applied for

  const ServiceApplicationScreen({super.key, required this.serviceName});

  @override
  _ServiceApplicationScreenState createState() =>
      _ServiceApplicationScreenState();
}

class _ServiceApplicationScreenState extends State<ServiceApplicationScreen> {
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final TextEditingController _preferredDateController =
      TextEditingController();
  final TextEditingController _specialRequirementsController =
      TextEditingController();

  // State selection variable
  String? _selectedState;
  final List<String> _states = [
    // List of states for the dropdown
    'Federal Territories',
    'Selangor',
    'Penang',
    'Perak',
    'Negeri Sembilan',
    'Johor',
    'Pahang',
    'Kedah',
    'Kelantan',
    'Sabah',
    'Sarawak',
    'Melaka',
    'Terengganu',
    'Perlis',
  ];

  @override
  void dispose() {
    // Dispose of controllers to free up resources
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _postalCodeController.dispose();
    _landmarkController.dispose();
    _preferredDateController.dispose();
    _specialRequirementsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Apply for ${widget.serviceName}', // Title with the service name
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24, // Increased font size
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
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the form
        child: Form(
          key: _formKey, // Assigning the form key for validation
          child: SingleChildScrollView(
            // Enables scrolling for smaller screens
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .stretch, // Stretching the column to fill the width
              children: [
                Text(
                  'Please fill out the form to apply for the ${widget.serviceName}.',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Full Name Field
                _buildTextField(_nameController, 'Full Name', Icons.person),

                const SizedBox(height: 10),
                // Phone Number Field
                _buildTextField(
                  _phoneController,
                  'Phone Number',
                  Icons.phone,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                // Address Field
                _buildTextField(
                  _addressController,
                  'Street Address',
                  Icons.home,
                ),

                // City Field
                const SizedBox(height: 10),
                _buildTextField(
                  _cityController,
                  'City/Town',
                  Icons.location_city,
                ),

                // State Dropdown
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _selectedState,
                  decoration: InputDecoration(
                    labelText: 'State/Region',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    prefixIcon: Icon(Icons.map, color: Colors.blueAccent),
                  ),
                  items: _states.map((String state) {
                    return DropdownMenuItem<String>(
                      value: state,
                      child: Text(state),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedState = newValue; // Update selected state
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a state'; // Validation for state selection
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),
                // Postal Code Field
                _buildTextField(
                  _postalCodeController,
                  'Postal Code',
                  Icons.code,
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 10),

                // Landmark Field
                _buildTextField(
                  _landmarkController,
                  'Nearby Landmark/Description',
                  Icons.landscape,
                  maxLines: 2,
                ),

                const SizedBox(height: 10),

                // Preferred Date Field with Date Picker
                GestureDetector(
                  onTap: () => _selectDate(context), // Opens date picker on tap
                  child: AbsorbPointer(
                    child: _buildTextField(
                      _preferredDateController,
                      'Preferred Service Date',
                      Icons.calendar_today,
                      keyboardType: TextInputType.none, // Prevent keyboard
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Special Requirements Field
                _buildTextField(
                  _specialRequirementsController,
                  'Special Requirements (if any)',
                  Icons.notes,
                  maxLines: 3,
                ),

                const SizedBox(height: 20),

                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Validate form and handle submission
                      _handleApplicationSubmission();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Submit Application'), // Button text
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom text field builder to reduce redundancy
  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label'; // Validation message
        }
        return null;
      },
    );
  }

  // Date Picker function to select a date
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Default date is today
      firstDate: DateTime(2000), // Minimum date
      lastDate: DateTime(2101), // Maximum date
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(), // Customize the theme of the date picker
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _preferredDateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}"; // Format date
      });
    }
  }

  void _handleApplicationSubmission() {
    // Collect application data into a map
    Map<String, String> newApplication = {
      'name': _nameController.text,
      'phone': _phoneController.text,
      'address': _addressController.text,
      'city': _cityController.text,
      'state': _selectedState ?? '',
      'postal_code': _postalCodeController.text,
      'landmark': _landmarkController.text,
      'preferred_date': _preferredDateController.text,
      'special_requirements': _specialRequirementsController.text,
    };

    // Add the new application to the list
    applications.add(newApplication);

    // Clear the form after submission
    _nameController.clear();
    _phoneController.clear();
    _addressController.clear();
    _cityController.clear();
    _postalCodeController.clear();
    _landmarkController.clear();
    _preferredDateController.clear();
    _specialRequirementsController.clear();
    _selectedState = null; // Reset the selected state

    // Navigate to the application status screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ApplicationStatusScreen(applications: applications),
      ),
    );
  }
}
