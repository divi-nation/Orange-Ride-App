import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/app/notification.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'profile.dart';  // Import the profile page

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController? _mapController;
  double _bottomSheetHeight = 0.3;
  bool _isFullScreen = false;
  bool _isSidePanelVisible = false;

  void _toggleBottomSheet() {
    setState(() {
      _isFullScreen = !_isFullScreen;
      _bottomSheetHeight = _isFullScreen ? 1.0 : 0.3;
    });
  }

  void _toggleSidePanel() {
    setState(() {
      _isSidePanelVisible = !_isSidePanelVisible;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _bottomSheetHeight = 0.3;
      });
    });
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(100, 248, 120, 69),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildSidePanel() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      left: _isSidePanelVisible ? 0 : -MediaQuery.of(context).size.width * 0.75,
      top: 0,
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(255, 222, 222, 222),
        child: Column(
          children: [
            _buildTopPanelDivision(2, Colors.white),
            SizedBox(height: 10.0),
            _buildMiddlePanelDivision(4, Colors.white),
            SizedBox(height: 10.0),
            _buildBottomPanelDivision(4, Colors.white),
          ],
        ),
      ),
    );
  }
Widget _buildTopPanelDivision(int flex, Color color) {
  return Expanded(
    flex: flex,
    child: Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, size: 30.0, color: Colors.grey[800]),
          ),
          SizedBox(width: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Divine',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'View profile',
                style: TextStyle(fontSize: 14.0, color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}


  Widget _buildMiddlePanelDivision(int flex, Color color) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavigationItem(Icons.payment, 'Payment'),
            _buildNavigationItem(Icons.local_offer, 'Promotions'),
            _buildNavigationItem(Icons.trip_origin, 'My Trips'),
            _buildNavigationItem(Icons.account_balance_wallet, 'Expenses'),
            _buildNavigationItem(Icons.support, 'Support'),
            _buildNavigationItem(Icons.info, 'About'),
          ],
        ),
      ),
    );
  }

 Widget _buildBottomPanelDivision(int flex, Color color) {
  return Expanded(
    flex: flex,
    child: Container(
      padding: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Become a driver\nEarn money on your schedule',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              Icon(Icons.close, color: Colors.grey),
            ],
          ),
        ),
      ),
    ),
  );
}

  Widget _buildNavigationItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          SizedBox(width: 10.0),
          Text(title, style: TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(37.7749, -122.4194), // Sample coordinates
              zoom: 14.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),
          // Gesture detector to close the side panel when clicking outside
          if (_isSidePanelVisible)
            Positioned.fill(
              child: GestureDetector(
                onTap: _toggleSidePanel,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          // Side panel
          _buildSidePanel(),
          // Top bar with icons
          if (!_isSidePanelVisible)
            Positioned(
              top: 40.0,
              left: 16.0,
              right: 16.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconButton(Icons.menu, _toggleSidePanel),
                  Row(
                    children: [
                      SizedBox(width: 10.0),
                      _buildIconButton(Icons.notifications, () {
                        // Handle notifications button press
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NotificationPage()),
                        );
                      }),
                      SizedBox(width: 10.0),
                      _buildIconButton(Icons.person, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage()),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          // Bottom sliding panel
          if (!_isSidePanelVisible)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.primaryDelta! < 0) {
                    _toggleBottomSheet();
                  } else if (details.primaryDelta! > 0) {
                    _toggleBottomSheet();
                  }
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: MediaQuery.of(context).size.height * _bottomSheetHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        spreadRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 30.0,
                        child: Center(
                          child: Container(
                            width: 60.0,
                            height: 5.0,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(2.5),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Where to?',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            _buildDestinationItem('Home', 'San Francisco, CA'),
                            _buildDestinationItem('Work', 'San Francisco, CA'),
                            _buildDestinationItem('Park', 'San Francisco, CA'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDestinationItem(String destination, String city) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.access_time, color: Colors.orange),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(destination, style: TextStyle(fontSize: 16.0)),
              Text(city, style: TextStyle(fontSize: 14.0, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
