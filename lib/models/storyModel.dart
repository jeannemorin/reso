class Story {
  final String title;
  final List<StorySlide> slides;

  Story({required this.title, required this.slides});
}

class StorySlide {
  final String imageUrl;
  final String? link;

  StorySlide({required this.imageUrl, this.link});
}
