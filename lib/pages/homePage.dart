import 'package:alumnfarce/models/profilModel.dart';
import 'package:alumnfarce/models/storyModel.dart';
import 'package:alumnfarce/pages/event/allEventsPage.dart';
import 'package:alumnfarce/pages/news/AllContentPage.dart';
import 'package:alumnfarce/pages/news/news.dart';
import 'package:alumnfarce/pages/profilPage.dart';
import 'package:alumnfarce/pages/storySlidePage.dart';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    AllEventsPage(),
    AllArticlesPage(),
    ProfilePage(
      user: User(
        profilePictureUrl: 'https://via.placeholder.com/150',
        name: 'John Doe',
        type: 'Organizer',
        activity: 'Tech Company',
        scoreLevel: 10,
        events: ['Event 1', 'Event 2'],
        writtenContent: ['Article 1', 'Article 2'],
        sharedExternalEvents: ['External Event 1', 'External Event 2'],
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StoriesRow(),
        Expanded(
          child: Center(
            child: Text(
              'Main Content',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to the Profile Page!',
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class StoriesRow extends StatelessWidget {
  final List<Story> stories = [
    Story(title: 'Story 1', slides: [
      StorySlide(imageUrl: 'images/cover.jpeg'),
      StorySlide(imageUrl: 'images/cover.jpeg'),
      StorySlide(imageUrl: 'images/cover.jpeg')
    ]),
    Story(title: 'Story 2', slides: [
      StorySlide(imageUrl: 'images/cover.jpeg'),
      StorySlide(imageUrl: 'images/cover.jpeg')
    ]),
    Story(
        title: 'Story 3', slides: [StorySlide(imageUrl: 'images/cover.jpeg')]),
    Story(title: 'Story 4', slides: [
      StorySlide(imageUrl: 'images/cover.jpeg'),
      StorySlide(imageUrl: 'images/cover.jpeg'),
      StorySlide(imageUrl: 'images/cover.jpeg'),
      StorySlide(imageUrl: 'images/cover.jpeg')
    ]),
    Story(title: 'Story 5', slides: [
      StorySlide(imageUrl: 'images/cover.jpeg'),
      StorySlide(imageUrl: 'images/cover.jpeg'),
      StorySlide(imageUrl: 'images/cover.jpeg'),
      StorySlide(imageUrl: 'images/cover.jpeg'),
      StorySlide(imageUrl: 'images/cover.jpeg')
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StorySlidesPage(story: story),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('images/cover.jpeg'),
                  ),
                  SizedBox(height: 8.0),
                  Text(story.title),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
