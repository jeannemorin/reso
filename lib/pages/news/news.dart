import "package:alumnfarce/models/articleModel.dart";
import "package:alumnfarce/pages/news/article.dart";
import 'package:flutter/material.dart';

class AllArticlesPage extends StatelessWidget {
  final List<Article> articles = [
    Article(
      title: 'How to find an idea for you business ? 5 steps for you',
      category: 'Technology',
      thumbnailUrl: 'images/article/start_your_business.png',
    ),
    Article(
      title: 'Article 2',
      category: 'Health',
      thumbnailUrl: 'images/cover.jpeg',
    ),
    Article(
      title: 'Article 3',
      category: 'Technology',
      thumbnailUrl: 'images/cover.jpeg',
    ),
    Article(
      title: 'Article 4',
      category: 'Lifestyle',
      thumbnailUrl: 'images/cover.jpeg',
    ),
    Article(
      title: 'Article 5',
      category: 'Health',
      thumbnailUrl: 'images/cover.jpeg',
    ),
    Article(
      title: 'Article 5',
      category: 'Random',
      thumbnailUrl: 'images/cover.jpeg',
    ),
    Article(
      title: 'Article 5',
      category: 'Test',
      thumbnailUrl: 'images/cover.jpeg',
    ),
    Article(
      title: 'Article 5',
      category: 'New',
      thumbnailUrl: 'images/cover.jpeg',
    ),
    Article(
      title: 'Article 5',
      category: 'Finance',
      thumbnailUrl: 'images/cover.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Article>> categorizedArticles = {};

    for (var article in articles) {
      if (categorizedArticles.containsKey(article.category)) {
        categorizedArticles[article.category]!.add(article);
      } else {
        categorizedArticles[article.category] = [article];
      }
    }

    return DefaultTabController(
      length: categorizedArticles.keys.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.amber,
            labelColor: Colors.amber,
            tabs: categorizedArticles.keys.map((category) {
              return Tab(text: category);
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: categorizedArticles.keys.map((category) {
            return ListView(
              children: categorizedArticles[category]!.map((article) {
                return ListTile(
                  leading: Image.asset(article.thumbnailUrl),
                  title: Text(article.title),
                  subtitle: Text(article.category),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ArticlePage()));
                  },
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}
