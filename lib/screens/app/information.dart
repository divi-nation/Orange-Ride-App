import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String info = ModalRoute.of(context)?.settings.arguments as String;

    String getInfoText(String info) {
      switch (info) {
        case 'legal':
          return "Once a driver has accepted your ride request, you can contact them by sending an in-app message. The history of the chat will be deleted upon completion of the ride. It is also possible to call the driver and this option will be available in the app for 24 hours after the ride ended. If you can’t reach the driver or more than 24 hours have passed, please contact our Support team for assistance.";
        // Add more cases for different info values
        default:
          return "No information available.";
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Information'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How to contact my driver',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              getInfoText(info),
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            const Center(
              child: Text(
                'Does this information solve your issue?',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('YES'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('NO'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
