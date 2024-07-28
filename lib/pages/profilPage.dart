import 'package:alumnfarce/models/profilModel.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final User user;

  ProfilePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(user: user),
              ActivityCard(
                title: 'Events Participating In',
                items: user.events,
              ),
              ActivityCard(
                title: 'Content Written',
                items: user.writtenContent,
              ),
              ActivityCard(
                title: 'Shared External Events',
                items: user.sharedExternalEvents,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final User user;

  ProfileHeader({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.profilePictureUrl),
            ),
            SizedBox(width: 16),
            Text(
              user.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text(
              user.type,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            Text(
              user.activity,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            IntrinsicHeight(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Score Level: ${user.scoreLevel}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                VerticalDivider(thickness: 1),
                Text(
                  'Info: 9',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                VerticalDivider(thickness: 1),
                Text(
                  'Other info: 12',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ]),
            ),
            SizedBox(
              height: 12,
            ),
            Divider(thickness: 2),
          ],
        )
      ],
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String title;
  final List<String> items;

  ActivityCard({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            ...items.map((item) => Text(item)).toList(),
          ],
        ),
      ),
    );
  }
}
