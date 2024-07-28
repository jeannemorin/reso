class User {
  final String profilePictureUrl;
  final String name;
  final String type;
  final String activity;
  final int scoreLevel;
  final List<String> events;
  final List<String> writtenContent;
  final List<String> sharedExternalEvents;

  User({
    required this.profilePictureUrl,
    required this.name,
    required this.type,
    required this.activity,
    required this.scoreLevel,
    required this.events,
    required this.writtenContent,
    required this.sharedExternalEvents,
  });
}
