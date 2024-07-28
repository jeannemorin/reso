import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

String _aboutSection =
    'Join us next month for an inspiring event hosted by the Entrepreneur Network! Connect with fellow innovators, share ideas, and gain insights from industry leaders. This networking opportunity will feature keynote speakers, interactive workshops, and a startup pitch competition.\n\n To attend, simply visit our event website to purchase your ticket. Early bird discounts are available until the end of this month, so act fast! The event will be held at the Downtown Convention Center, easily accessible by public transportation and with ample parking available for those driving. Mark your calendars and be part of a dynamic community driving change and growth in the entrepreneurial landscape. Don t miss this chance to expand your network and fuel your business aspirations!';

class _EventPageState extends State<EventPage> {
  bool _showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'images/cover.jpeg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                    Positioned(
                      bottom: 16.0,
                      right: 16.0,
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.share, color: Colors.white),
                            onPressed: () {
                              // Handle share action
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Event Title',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Organized by Organizer Name',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          // Handle "Interested" button press
                        },
                        child: Text('Interested'),
                      ),
                      SizedBox(height: 16.0),
                      _buildEventDetails(),
                      SizedBox(height: 16.0),
                      _buildAboutSection(),
                      SizedBox(height: 16.0),
                      _buildLocationSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildBuyTicketsButton(context),
        ],
      ),
    );
  }

  Widget _buildEventDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date and Time',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('July 24, 2024, 6:00 PM - 9:00 PM'),
        Divider(),
        Text(
          'Place',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('Event Venue Name'),
        Divider(),
        Text(
          'Exact Location',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('123 Event St, City, Country'),
      ],
    );
  }

  Widget _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        _showFullDescription
            ? Text(_aboutSection)
            : Text(
                _aboutSection,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
        GestureDetector(
          onTap: () {
            setState(() {
              _showFullDescription = !_showFullDescription;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                _showFullDescription ? 'Show less' : 'Show more',
                style: TextStyle(color: Colors.blue),
              ),
              Icon(
                _showFullDescription
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLocationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          height: 200.0,
          color: Colors.grey[300],
          child: Center(
            child: Text('Map Placeholder'),
          ),
        ),
      ],
    );
  }

  Widget _buildBuyTicketsButton(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle buy tickets button press
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16.0),
          ),
          child: Text('Buy Tickets from \$20'),
        ),
      ),
    );
  }
}
