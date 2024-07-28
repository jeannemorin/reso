import "package:alumnfarce/models/articleModel.dart";
import "package:alumnfarce/pages/news/article.dart";
import 'package:flutter/material.dart';

final List<String> categories = ['Tech', 'Science', 'Health', 'Sports'];
final Map<String, List<Map<String, String>>> articles = {
  'Tech': [
    {
      'coverImageUrl': 'https://via.placeholder.com/150',
      'title': 'Tech Article 1',
      'author': 'Author 1'
    },
    {
      'coverImageUrl': 'https://via.placeholder.com/150',
      'title': 'Tech Article 2',
      'author': 'Author 2'
    },
  ],
  'Science': [
    {
      'coverImageUrl': 'https://via.placeholder.com/150',
      'title': 'Science Article 1',
      'author': 'Author 3'
    },
    {
      'coverImageUrl': 'https://via.placeholder.com/150',
      'title': 'Science Article 2',
      'author': 'Author 4'
    },
  ],
  'Health': [
    {
      'coverImageUrl': 'https://via.placeholder.com/150',
      'title': 'Health Article 1',
      'author': 'Author 5'
    },
    {
      'coverImageUrl': 'https://via.placeholder.com/150',
      'title': 'Health Article 2',
      'author': 'Author 6'
    },
  ],
  'Sports': [
    {
      'coverImageUrl': 'https://via.placeholder.com/150',
      'title': 'Sports Article 1',
      'author': 'Author 7'
    },
    {
      'coverImageUrl': 'https://via.placeholder.com/150',
      'title': 'Sports Article 2',
      'author': 'Author 8'
    },
  ],
};

class CustomTab extends StatelessWidget {
  final String title;
  bool isActive;

  CustomTab({required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.blue),
          backgroundColor: isActive ? Colors.blue : Colors.transparent,
        ),
        onPressed: () {
          isActive = true;
        },
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.blue,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final String coverImageUrl;
  final String title;
  final String author;

  ArticleCard(
      {required this.coverImageUrl, required this.title, required this.author});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ArticlePage()));
        },
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Image.network(coverImageUrl,
                fit: BoxFit.cover, width: 50.0, height: 50.0),
            title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('by $author'),
          ),
        ));
  }
}

class ArticlesPage extends StatefulWidget {
  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              tabs: List.generate(categories.length, (index) {
                return CustomTab(
                  title: categories[index],
                  isActive: _tabController.index == index,
                );
              }),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: categories.map((category) {
          return ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: articles[category]!.length,
            itemBuilder: (context, index) {
              final article = articles[category]![index];
              return ArticleCard(
                coverImageUrl: article['coverImageUrl']!,
                title: article['title']!,
                author: article['author']!,
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
