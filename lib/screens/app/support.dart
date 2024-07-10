import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SupportPage(),
      routes: {
        '/history': (context) => const HistoryPage(), // Define your history/mytrips page here
      },
    );
  }
}

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        title: const Text(
          'How can we help?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // Handle exit tap
            },
            child: const Text(
              'Exit',
              style: TextStyle(
                color: Colors.green,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Support cases',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const ListTile(
              leading: Icon(Icons.chat_bubble_outline),
              title: Text('Inbox'),
              subtitle: Text('View open chats'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(height: 26.0),
            const Text(
              'Get help with a recent ride',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: const Icon(Icons.directions_car),
              title: const Text('Kumasi, Ghana'),
              subtitle: const Text('10 Jul at 17:34'),
              trailing: const Text(
                'Cancelled',
                style: TextStyle(color: Colors.red),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.directions_car),
              title: const Text('College of Science, Kumasi'),
              subtitle: const Text('4 Jun at 12:41'),
              trailing: const Text('GH¢23.00'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/history');
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Select an older ride',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 26.0),
            const Text(
              'Get help with something else',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const ListTile(
              title: Text('About Bolt'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const ListTile(
              title: Text('App and features'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const ListTile(
              title: Text('Account and data'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const ListTile(
              title: Text('Payments and pricing'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const ListTile(
              title: Text('Using Bolt'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History / My Trips'),
      ),
      body: Center(
        child: const Text('History / My Trips Page'),
      ),
    );
  }
}
