import 'package:flutter/material.dart';

class FamilyMembersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample family members list
    final familyMembers = [
      {
        'name': 'Nicole',
        'relation': 'Big Sister',
        'details': 'Nicole is a caring Sister.',
        'image': 'assets/nicole.jpeg' //  the path to Nicole's image
      },
      {
        'name': 'Rose',
        'relation': 'Little Sister',
        'details': 'Rose is a brilliant Student.',
        'image': 'assets/rose.jpeg' // the path to Rose's image
      },
      {
        'name': 'Fredrick',
        'relation': 'Brother',
        'details': 'Fredrick is very hardworking.',
        'image': 'assets/fredrick.jpeg' // the path to Fredrick's image
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Members'),
      ),
      body: ListView.builder(
        itemCount: familyMembers.length,
        itemBuilder: (context, index) {
          final member = familyMembers[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              backgroundImage:
                  AssetImage(member['image']!), // Display the image
            ),
            title: Text(
              member['name']!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(member['relation']!),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FamilyMemberDetailsScreen(member: member),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class FamilyMemberDetailsScreen extends StatelessWidget {
  final Map<String, String> member;

  const FamilyMemberDetailsScreen({Key? key, required this.member})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(member['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage:
                  AssetImage(member['image']!), // Display the image
            ),
            const SizedBox(height: 20),
            Text(
              member['name']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Relation: ${member['relation']}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              member['details']!,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
