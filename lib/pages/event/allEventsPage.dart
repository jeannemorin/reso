import 'package:alumnfarce/models/eventModel.dart';
import 'package:alumnfarce/pages/event/event.dart';
import 'package:flutter/material.dart';

class AllEventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<AllEventsPage> {
  String _selectedCity = 'Current City'; // Replace with the actual default city
  List<String> _cities = ['City 1', 'City 2', 'City 3']; // List of cities
  List<Event> _events = []; // List of events, populate with actual data

  @override
  void initState() {
    super.initState();
    // Initialize _events with sample data
    _events = [
      Event(
        coverImageUrl: '/images/cover.jpeg',
        title: 'Sample Event 1',
        location: 'Location 1',
        dateTime: DateTime.now().add(Duration(days: 1)),
        status: 'price',
      ),
      Event(
        coverImageUrl: '/images/cover.jpeg',
        title: 'Sample Event 1',
        location: 'Location 1',
        dateTime: DateTime.now().add(Duration(days: 1)),
        status: 'price',
      ),
      Event(
        coverImageUrl: '/images/cover.jpeg',
        title: 'Sample Event 1',
        location: 'Location 1',
        dateTime: DateTime.now().add(Duration(days: 1)),
        status: 'price',
      ),
      Event(
        coverImageUrl: '/images/cover.jpeg',
        title: 'Sample Event 1',
        location: 'Location 1',
        dateTime: DateTime.now().add(Duration(days: 1)),
        status: 'price',
      ),
      Event(
        coverImageUrl: '/images/cover.jpeg',
        title: 'Sample Event 1',
        location: 'Location 1',
        dateTime: DateTime.now().add(Duration(days: 1)),
        status: 'price',
      ),
      // Add more events here
    ];
  }

  void _onCitySelected(String newCity) {
    setState(() {
      _selectedCity = newCity;
    });
  }

  Widget _buildEventItem(Event event) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EventPage()));
      },
      child: Card(
        elevation: 0.0,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Image.asset(event.coverImageUrl,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: 200),
              Positioned(
                bottom: 16.0,
                right: 16.0,
                child: IconButton(
                  icon: const Icon(Icons.favorite_border,
                      color: Colors.white, size: 30),
                  onPressed: () {
                    // Handle heart button press
                  },
                ),
              ),
            ]),
            // Heart Button
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Title
                  Text(
                    event.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 4),
                  // Location
                  Text(
                    event.location,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  // Date (Day)

                  // Time and Status
                  Row(
                    children: [
                      Text(
                        '${_getDayName(event.dateTime.weekday)} ${event.dateTime.day} ${_getMonthName(event.dateTime.month)}',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                      const VerticalDivider(
                        color: Colors.red,
                        thickness: 1,
                        width: 10,
                      ),
                      Text(
                        '${event.dateTime.hour}:${event.dateTime.minute}',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                      VerticalDivider(color: Colors.white, thickness: 1),
                      Text(
                        event.status,
                        style: TextStyle(
                          color: event.status == 'sold out'
                              ? Colors.red
                              : (event.status == 'free'
                                  ? Colors.green
                                  : Colors.orange),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getDayName(int weekday) {
    const List<String> weekdays = [
      'mon',
      'tues',
      'wed',
      'thur',
      'fri',
      'sat',
      'sun'
    ];

    if (weekday < 1 || weekday > 7) {
      throw ArgumentError('Weekday must be between 1 and 7');
    }

    return weekdays[weekday - 1];
  }

  String _getMonthName(int month) {
    const List<String> months = [
      'jan.',
      'feb.',
      'march.',
      'april',
      'may',
      'june',
      'july',
      'Aug.',
      'sept.',
      'oct.',
      'nov.',
      'dec.'
    ];

    if (month < 1 || month > 12) {
      throw ArgumentError('Month must be between 1 and 12');
    }

    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextButton.icon(
            onPressed: () {
              _showCitySelectionDialog(context);
            },
            icon: const Icon(Icons.place),
            label: Text(_selectedCity),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(8),
              child: IconButton(
                icon: Icon(Icons.map),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: ListView.separated(
          itemCount: _events.length,
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            return _buildEventItem(_events[index]);
          },
        ));
  }

  void _showCitySelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select City'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: _cities.map((city) {
              return ListTile(
                title: Text(city),
                onTap: () {
                  _onCitySelected(city);
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
