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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Today", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          ...notifications.where((notification) => notification['date'] == 'Today').map((notification) => buildNotificationItem(notification)).toList(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Yesterday", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          ...notifications.where((notification) => notification['date'] == 'Yesterday').map((notification) => buildNotificationItem(notification)).toList(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("May, 27 2023", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          ...notifications.where((notification) => notification['date'] == 'May, 27 2023').map((notification) => buildNotificationItem(notification)).toList(),
        ],
      ),
    );
  }

  Widget buildNotificationItem(Map<String, String> notification) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.orange,
            child: Icon(Icons.notifications, color: Colors.white),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification['title']!,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.0),
                Text(
                  notification['description']!,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
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
