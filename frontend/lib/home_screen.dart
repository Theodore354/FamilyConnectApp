import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyFamilyConnectApp'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Handle logout logic here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out')),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        AssetImage('assets/luda.jpeg'), // profile picture
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Theodore Lutterodt',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'alberttheodore17@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Family Members'),
              onTap: () {
                // Navigate to Family Members screen
                Navigator.pushNamed(context, '/family_members');
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {
                // Navigate to Notifications screen
                Navigator.pushNamed(context, '/notifications');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to Settings screen
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to the Homepage!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Family Members'),
            _buildFamilyMembersSection(),
            const SizedBox(height: 20),
            _buildSectionTitle('Recent Activities'),
            _buildRecentActivitiesSection(),
            const SizedBox(height: 20),
            _buildSectionTitle('Quick Actions'),
            _buildQuickActionsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildFamilyMembersSection() {
    // Sample family members list
    final familyMembers = [
      {'name': 'Nicole', 'relation': 'Big Sister'},
      {'name': 'Rose', 'relation': 'Little Sister'},
      {'name': 'Fredrick', 'relation': 'Brother'},
    ];

    return Container(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: familyMembers.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final member = familyMembers[index];
          return Container(
            width: 80,
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person, size: 40, color: Colors.red),
                const SizedBox(height: 5),
                Text(
                  member['name']!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  member['relation']!,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecentActivitiesSection() {
    // Placeholder for recent activities
    return Container(
      height: 100,
      color:
          Colors.blue, // Change this to your desired UI for recent activities
      child: const Center(
        child: Text('Recent Activities'),
      ),
    );
  }

  Widget _buildQuickActionsSection() {
    // Placeholder for quick actions
    return Container(
      height: 100,
      color: Colors.green, // Change this to your desired UI for quick actions
      child: const Center(
        child: Text('Quick Actions'),
      ),
    );
  }
}
