import 'package:NewsStream/models/article_model.dart';
import 'package:NewsStream/services/news_service.dart';
import 'package:NewsStream/widgets/news_list_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key,required this.category});
final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;

  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getTopHeadlines(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const SliverFillRemaining(
            child: Center(
              child: Text('oops was an error, try later.'),
            ),
          );
        } else {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
