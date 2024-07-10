import 'package:flutter/material.dart';

class TripsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set Scaffold background color to white

     appBar: AppBar(
  backgroundColor: Colors.white,
  title: const Text(
    'My trips',
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

      body: ListView(
        children: [
          TripSection(
            month: 'June 2024',
            trips: [
              Trip(
                location: 'College of Science, Kumasi',
                date: '4 Jun, 12:41',
                amount: 'GH₵ 23.00',
              ),
            ],
          ),
          TripSection(
            month: 'May 2024',
            trips: [
              Trip(
                location: 'Jubilee Mall, Commercial Area',
                date: '25 May, 11:11',
                amount: 'GH₵ 20.00',
              ),
              Trip(
                location: 'Ayeduase Gate, Ayeduase Road',
                date: '23 May, 15:03',
                amount: 'GH₵ 15.00',
              ),
              Trip(
                location: 'PizzaMan - ChickenMan, Main Street',
                date: '23 May, 13:24',
                amount: 'GH₵ 15.00',
              ),
              Trip(
                location: 'Anloga Onion Market, Kumasi',
                date: '20 May, 16:57',
                amount: 'GH₵ 24.00',
              ),
              Trip(
                location: 'Anloga Onion Market, Kumasi',
                date: '20 May, 16:47',
                amount: 'GH₵ 0.00',
                cancelled: true,
              ),
            ],
          ),
          TripSection(
            month: 'March 2024',
            trips: [
              Trip(
                location: 'SRC Hostel, SRC Hostel Area',
                date: '9 Mar, 14:11',
                amount: 'GH₵ 0.00',
                cancelled: true,
              ),
            ],
          ),
          TripSection(
            month: 'February 2024',
            trips: [
              Trip(
                location: 'Standard Hostel, Bosmo Road',
                date: '10 Feb, 17:12',
                amount: 'GH₵ 0.00',
                cancelled: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TripSection extends StatelessWidget {
  final String month;
  final List<Trip> trips;

  TripSection({required this.month, required this.trips});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            month,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8.0),
          Column(
            children: trips.map((trip) => TripTile(trip: trip)).toList(),
          ),
        ],
      ),
    );
  }
}

class TripTile extends StatelessWidget {
  final Trip trip;

  TripTile({required this.trip});

  @override
  Widget build(BuildContext context) {
    return ListTile(
    leading: Icon(Icons.motorcycle_rounded, size: 40),      
    title: Text(trip.location),
      subtitle: Text(trip.date),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(trip.amount, style: TextStyle(fontWeight: FontWeight.bold)),
          if (trip.cancelled)
            Text(
              'Trip Cancelled',
              style: TextStyle(color: Colors.grey),
            ),
        ],
      ),
    );
  }
}

class Trip {
  final String location;
  final String date;
  final String amount;
  final bool cancelled;

  Trip({
    required this.location,
    required this.date,
    required this.amount,
    this.cancelled = false,
  });
}
