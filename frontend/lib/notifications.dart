import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  notifications list
    final notifications = [
      {
        'title': 'New Message from Alice',
        'description': 'Nicole: "Can you pick up groceries?"',
        'time': 'in some minutes time',
      },
      {
        'title': 'Family Dinner',
        'description': 'Family Dinner at 7 PM tonight.',
        'time': '2 hours time',
      },
      {
        'title': 'System Update',
        'description': 'Your app is up to date.',
        'time': 'a while ago',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading:
                  const Icon(Icons.notifications, size: 40, color: Colors.red),
              title: Text(
                notification['title']!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification['description']!),
                  const SizedBox(height: 5),
                  Text(
                    notification['time']!,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NotificationDetailsScreen(notification: notification),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class NotificationDetailsScreen extends StatelessWidget {
  final Map<String, String> notification;

  const NotificationDetailsScreen({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(notification['title']!),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification['title']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Time: ${notification['time']}',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              notification['description']!,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
