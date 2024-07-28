import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollProgress = 0.0;

  String markdownData =
      """Starting a business begins with a great idea. But how do you come up with that idea? Here’s a step-by-step guide to help you brainstorm and identify a business concept that could be your next big success.


## 1. Identify Your Passion and Skills
Your business should align with your interests and strengths. Consider the following:
- **Passions:** What activities or topics excite you the most?
- **Skills:** What are you particularly good at? Think about both professional skills and personal talents.

### Exercise:
Write down your top five passions and skills. Look for overlaps that could point to a business idea.

## 2. Solve a Problem
Great businesses often start by solving a common problem. Pay attention to issues you encounter in your daily life or ask others about the challenges they face.

### Exercise:
- **Observe:** Take a week to observe and note down everyday problems.
- **Ask Around:** Talk to friends, family, and colleagues about the issues they encounter.

## 3. Research the Market
Understanding the market is crucial. Research existing businesses and identify gaps or areas for improvement. 

### Tips:
- **Competitive Analysis:** Look at successful businesses in your area of interest. What are they doing right? Where are they lacking?
- **Trends:** Stay updated with industry trends and emerging technologies. These can provide insights into new opportunities.

## 4. Brainstorm with Others
Two heads are better than one. Engage in brainstorming sessions with peers, mentors, or through networking events.

### Activity:
- **Group Brainstorming:** Organize a session with fellow entrepreneurs to bounce ideas off each other.
- **Feedback:** Present your ideas and get constructive feedback.

## 5. Validate Your Idea
Before fully committing, test your idea to see if there's a market for it. 

### Methods:
- **Surveys:** Conduct surveys to gauge interest in your idea.
- **MVP (Minimum Viable Product):** Create a simple version of your product or service to test with a small audience.
- **Feedback:** Use feedback from your MVP to refine your idea.

## Conclusion
Finding the right business idea is a blend of self-discovery, problem-solving, research, collaboration, and validation. By following these steps, you'll be well on your way to identifying a concept that not only excites you but also has the potential to succeed.

Embark on this journey with an open mind and a proactive approach, and you'll uncover opportunities that can lead to a thriving business. Happy brainstorming!

---

Stay connected with us on social media for more tips and resources on your entrepreneurial journey!""";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollProgress = _scrollController.position.pixels /
            _scrollController.position.maxScrollExtent;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
        title: Text('All articles written'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Article Title',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Category: Technology',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Image.asset(
                      '/images/article/start_your_business.png',
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 16.0),
                    _buildAuthorInfo(),
                    SizedBox(height: 16.0),
                    _buildArticleContent(),
                  ],
                ),
              ),
            ),
          ),
          LinearProgressIndicator(
            value: _scrollProgress,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          _buildCTA(),
        ],
      ),
    );
  }

  Widget _buildAuthorInfo() {
    return const Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("images/user.png"),
          radius: 25.0,
        ),
        SizedBox(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Author Name',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Published on July 24, 2024',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildArticleContent() {
    return MarkdownBody(
      data: markdownData,
      styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
        p: Theme.of(context).textTheme.bodyMedium,
        h1: Theme.of(context).textTheme.bodyLarge,
        h2: Theme.of(context).textTheme.headlineMedium,
        h3: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget _buildCTA() {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                // Add share functionality here
              },
            ),
            IconButton(
              icon: Icon(Icons.bookmark),
              onPressed: () {
                // Add bookmark functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}
