import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/app/trips.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'ride.dart';
import 'trips.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  GoogleMapController? _mapController;
  bool _isSidePanelVisible = false;
  String _searchText = "";
  double _initialHeight = 0.3;
  final double _minHeight = 0.3;
  final double _maxHeight = 1.0;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  final String mapStyle = '''
    [
      {
          "featureType": "water",
          "elementType": "geometry",
          "stylers": [
              {
                  "color": "#e9e9e9"
              },
              {
                  "lightness": 17
              }
          ]
      },
      {
          "featureType": "landscape",
          "elementType": "geometry",
          "stylers": [
              {
                  "color": "#f5f5f5"
              },
              {
                  "lightness": 20
              }
          ]
      },
      {
          "featureType": "road.highway",
          "elementType": "geometry.fill",
          "stylers": [
              {
                  "color": "#ffffff"
              },
              {
                  "lightness": 17
              }
          ]
      },
      {
          "featureType": "road.highway",
          "elementType": "geometry.stroke",
          "stylers": [
              {
                  "color": "#ffffff"
              },
              {
                  "lightness": 29
              },
              {
                  "weight": 0.2
              }
          ]
      },
      {
          "featureType": "road.arterial",
          "elementType": "geometry",
          "stylers": [
              {
                  "color": "#ffffff"
              },
              {
                  "lightness": 18
              }
          ]
      },
      {
          "featureType": "road.local",
          "elementType": "geometry",
          "stylers": [
              {
                  "color": "#ffffff"
              },
              {
                  "lightness": 16
              }
          ]
      },
      {
          "featureType": "poi",
          "elementType": "geometry",
          "stylers": [
              {
                  "color": "#f5f5f5"
              },
              {
                  "lightness": 21
              }
          ]
      },
      {
          "featureType": "poi.park",
          "elementType": "geometry",
          "stylers": [
              {
                  "color": "#dedede"
              },
              {
                  "lightness": 21
              }
          ]
      },
      {
          "elementType": "labels.text.stroke",
          "stylers": [
              {
                  "visibility": "on"
              },
              {
                  "color": "#ffffff"
              },
              {
                  "lightness": 16
              }
          ]
      },
      {
          "elementType": "labels.text.fill",
          "stylers": [
              {
                  "saturation": 36
              },
              {
                  "color": "#333333"
              },
              {
                  "lightness": 40
              }
          ]
      },
      {
          "elementType": "labels.icon",
          "stylers": [
              {
                  "visibility": "off"
              }
          ]
      },
      {
          "featureType": "transit",
          "elementType": "geometry",
          "stylers": [
              {
                  "color": "#f2f2f2"
              },
              {
                  "lightness": 19
              }
          ]
      },
      {
          "featureType": "administrative",
          "elementType": "geometry.fill",
          "stylers": [
              {
                  "color": "#fefefe"
              },
              {
                  "lightness": 20
              }
          ]
      },
      {
          "featureType": "administrative",
          "elementType": "geometry.stroke",
          "stylers": [
              {
                  "color": "#fefefe"
              },
              {
                  "lightness": 17
              },
              {
                  "weight": 1.2
              }
          ]
      }
    ]
  ''';


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),  // Set duration to 0.6 seconds
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  void _toggleSidePanel() {
    setState(() {
      _isSidePanelVisible = !_isSidePanelVisible;
      if (_isSidePanelVisible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  void _updateSearchText(String text) {
    setState(() {
      _searchText = text;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.orange),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.black),
          hintText: "Where to?",
          hintStyle: const TextStyle(color: Colors.black54),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: _updateSearchText,
      ),
    );
  }

  Widget _buildSuggestionList() {
    List<String> suggestions = [
      "Kumasi",
      "Anloga Onion Market",
      "AIRPORT ROUND ABOUT Total Service St...",
    ];

    return Column(
      children: suggestions.map((suggestion) {
        return ListTile(
          leading: const Icon(Icons.access_time, color: Colors.orange),
          title: Text(suggestion),
          onTap: () {
            setState(() {
              _searchText = suggestion;
              _initialHeight = _maxHeight;
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildDestinationInput() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.location_on, color: Colors.black),
          hintText: "Current Location",
          hintStyle: const TextStyle(color: Colors.black54),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
        ),
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
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.7749, -122.4194), // Sample coordinates
              zoom: 14.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
              _mapController!.setMapStyle(mapStyle); // Apply custom map style here
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
                  const Row(
                    // children: [
                    //   SizedBox(width: 10.0),
                    //   _buildIconButton(Icons.notifications, () {
                    //     // Handle notifications button press
                    //   }),
                    //   SizedBox(width: 10.0),
                    //   _buildIconButton(Icons.person, () {
                    //     // Handle profile button press
                    //   }),
                    // ],
                  ),
                ],
              ),
            ),
          // Draggable bottom sheet
          if (!_isSidePanelVisible)
            DraggableScrollableSheet(
              initialChildSize: _initialHeight,
              minChildSize: _minHeight,
              maxChildSize: _maxHeight,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onVerticalDragUpdate: (details) {
                          if (details.primaryDelta! < 0 && _initialHeight == _minHeight) {
                            setState(() {
                              _initialHeight = _maxHeight;
                            });
                          } else if (details.primaryDelta! > 0 && _initialHeight == _maxHeight) {
                            setState(() {
                              _initialHeight = _minHeight;
                            });
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          height: 5.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      _buildSearchBar(),
                      Expanded(
                        child: ListView(
                          controller: scrollController,
                          children: [
                            if (_initialHeight == _minHeight) _buildSuggestionList(),
                            if (_initialHeight == _maxHeight) ...[
                              _buildDestinationInput(),
                              const SizedBox(height: 20.0),
                              Center(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RidePage(destination: _searchText),
                                      ),
                                    );
                                  },
                                  label: const Text(
                                    "Select ride",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  icon: const Icon(Icons.directions_car),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _buildSidePanel() {
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(255, 222, 222, 222),
        child: Column(
          children: [
            _buildTopPanelDivision(2, Colors.white),
            const SizedBox(height: 10.0),
            _buildMiddlePanelDivision(4, Colors.white),
            const SizedBox(height: 10.0),
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
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
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
            const SizedBox(width: 10.0),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Divine',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'View profile',
                  style: TextStyle(fontSize: 14.0, color: Colors.orange),
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

            ListTile(
              leading: const Icon(Icons.notification_important),
              title: const Text("Notifications"),
              onTap: () {

              },
            ),
            ListTile(
              leading: const Icon(Icons.money),
              title: const Text('Discounts'),
              onTap: (){

              },
            ),

            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('History'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TripsPage()),
                );
              },
            ),
            const ListTile(
              leading: Icon(Icons.support),
              title: Text('Support'),
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help'),
              onTap: () {
                // Handle help tap
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomPanelDivision(int flex, Color color) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Divider(color: Colors.grey[300], thickness: 1.0),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Handle logout tap
              },
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: HomePage()));
}
