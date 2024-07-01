import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController? _mapController;
  double _bottomSheetHeight = 0.3;
  bool _isFullScreen = false;

  void _toggleBottomSheet() {
    setState(() {
      _isFullScreen = !_isFullScreen;
      _bottomSheetHeight = _isFullScreen ? 1.0 : 0.3;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          HtmlElementView(viewType: 'map-container'), // Integrate Google Maps for Web
          // Top bar with icons
          Positioned(
            top: 40.0,
            left: 16.0,
            right: 16.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconButton(Icons.menu),
                Row(
                  children: [
                    _buildIconButton(Icons.search),
                    SizedBox(width: 10.0),
                    _buildIconButton(Icons.notifications),
                  ],
                ),
              ],
            ),
          ),
          // Bottom sliding panel
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

  Widget _buildIconButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(100, 248, 120, 69),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: () {},
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
              Text(
                destination,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text(
                city,
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
