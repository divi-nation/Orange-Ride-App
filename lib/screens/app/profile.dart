import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _districtController = TextEditingController();
  String _selectedCountryCode = '+1';

  void _showPopup(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
  backgroundColor: Colors.white,
  title: const Text(
    'Notification',
    style: TextStyle(
      color: Colors.black, // Set the title color to black
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
    ),
  ),
  leading: GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: const Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          Icon(Icons.arrow_back_ios, color: Colors.black),
          SizedBox(width: 4.0),
          Text(
            'Back',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    ),
  ),
  centerTitle: true,
),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 75, // Increased radius for larger image
                    backgroundImage: AssetImage('assets/profile_picture.png'), // Replace with your profile picture asset
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt),
                      onPressed: () {
                        // Handle profile picture selection
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0), // Increased space below profile image
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  border: UnderlineInputBorder( // Only bottom border
                    borderSide: BorderSide(color: Colors.grey[600]!),
                  ),
                ),
              ),
              const SizedBox(height: 24.0), // Increased space between inputs
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: DropdownButtonFormField<String>(
                      value: _selectedCountryCode,
                      decoration: InputDecoration(
                        labelText: 'Code',
                        labelStyle: TextStyle(color: Colors.grey[600]),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[600]!),
                        ),
                      ),
                      items: <String>['+233', '+1', '+91', '+44', '+81', '+61'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCountryCode = newValue!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    flex: 7,
                    child: TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        labelStyle: TextStyle(color: Colors.grey[600]),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[600]!),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[600]!),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              TextField(
                controller: _streetController,
                decoration: InputDecoration(
                  labelText: 'Street',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[600]!),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'City',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[600]!),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              TextField(
                controller: _districtController,
                decoration: InputDecoration(
                  labelText: 'District',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[600]!),
                  ),
                ),
              ),
              const SizedBox(height: 40.0), // Increased space before buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      _showPopup('Are you sure you want to cancel? Changes will not be saved.');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.orange),
                      foregroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.4, 48.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showPopup('Changes saved.');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.4, 48.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Save'),
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
