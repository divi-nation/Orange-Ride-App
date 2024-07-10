import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AboutPage(),
      routes: {
        '/rateApp': (context) => const RateAppPage(), // Define your pages here
        '/likeOnFacebook': (context) => const LikeOnFacebookPage(),
        '/solutionsForWorkTrips': (context) => const SolutionsForWorkTripsPage(),
        '/careersAtBolt': (context) => const CareersAtBoltPage(),
        '/legal': (context) => const LegalPage(),
      },
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
          'About',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            const Text(
              'Version CI.117.0 (125522894)',
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
            const SizedBox(height: 16.0),
            ListTile(
              leading: const Icon(Icons.star_border),
              title: const Text('Rate the app'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/rateApp');
              },
            ),
            ListTile(
              leading: const Icon(Icons.thumb_up_alt_outlined),
              title: const Text('Like us on Facebook'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/likeOnFacebook');
              },
            ),
            ListTile(
              leading: const Icon(Icons.work_outline),
              title: const Text('Solutions for work trips'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/solutionsForWorkTrips');
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text('Careers at Bolt'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/careersAtBolt');
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_outlined),
              title: const Text('Legal'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/legal');
              },
            ),
            const SizedBox(height: 32.0),
            const Center(
              child: Text(
                'Made with ❤️ in Ghana',
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder pages for navigation
class RateAppPage extends StatelessWidget {
  const RateAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate the app'),
      ),
      body: const Center(
        child: Text('Rate the app page'),
      ),
    );
  }
}

class LikeOnFacebookPage extends StatelessWidget {
  const LikeOnFacebookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Like us on Facebook'),
      ),
      body: const Center(
        child: Text('Like us on Facebook page'),
      ),
    );
  }
}

class SolutionsForWorkTripsPage extends StatelessWidget {
  const SolutionsForWorkTripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solutions for work trips'),
      ),
      body: const Center(
        child: Text('Solutions for work trips page'),
      ),
    );
  }
}

class CareersAtBoltPage extends StatelessWidget {
  const CareersAtBoltPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Careers at Bolt'),
      ),
      body: const Center(
        child: Text('Careers at Bolt page'),
      ),
    );
  }
}

class LegalPage extends StatelessWidget {
  const LegalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Legal'),
      ),
      body: const Center(
        child: Text('Legal page'),
      ),
    );
  }
}
