import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "title": "Payment Successfully!",
      "description": "Lorem ipsum dolor sit amet consectetur. Ut enim ad minim veniam.",
      "date": "Today"
    },
    {
      "title": "30% Special Discount!",
      "description": "Lorem ipsum dolor sit amet consectetur. Ut enim ad minim veniam.",
      "date": "Today"
    },
    {
      "title": "Payment Successfully!",
      "description": "Lorem ipsum dolor sit amet consectetur. Ut enim ad minim veniam.",
      "date": "Yesterday"
    },
    {
      "title": "Credit Card added!",
      "description": "Lorem ipsum dolor sit amet consectetur. Ut enim ad minim veniam.",
      "date": "Yesterday"
    },
    {
      "title": "Added Money wallet Successfully!",
      "description": "Lorem ipsum dolor sit amet consectetur. Ut enim ad minim veniam.",
      "date": "Yesterday"
    },
    {
      "title": "5% Special Discount!",
      "description": "Lorem ipsum dolor sit amet consectetur. Ut enim ad minim veniam.",
      "date": "Yesterday"
    },
    {
      "title": "Payment Successfully!",
      "description": "Lorem ipsum dolor sit amet consectetur. Ut enim ad minim veniam.",
      "date": "May, 27 2023"
    },
  ];

  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Colors.white,
  title: const Text(
    'Notifications',
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Today", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          ...notifications.where((notification) => notification['date'] == 'Today').map((notification) => buildNotificationItem(notification)),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Yesterday", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          ...notifications.where((notification) => notification['date'] == 'Yesterday').map((notification) => buildNotificationItem(notification)),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("May, 27 2023", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          ...notifications.where((notification) => notification['date'] == 'May, 27 2023').map((notification) => buildNotificationItem(notification)),
        ],
      ),
    );
  }

  Widget buildNotificationItem(Map<String, String> notification) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.notifications, color: Colors.white),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification['title']!,
                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4.0),
                Text(
                  notification['description']!,
                  style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NotificationPage(),
  ));
}
