// import 'dart:async';
//
// import 'package:NewsStream/models/article_model.dart';
// import 'package:NewsStream/services/news_service.dart';
// import 'package:NewsStream/widgets/news_tile.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
// class NewsListView extends StatefulWidget {
//   const NewsListView({super.key});
//
//   @override
//   State<NewsListView> createState() => _NewsListViewState();
// }
//
// class _NewsListViewState extends State<NewsListView> {
//   bool isLoading = true;
//   List<ArticleModel> articles = [];
//   @override
//   void initState() {
//     super.initState();
//     getGeneralNews();
//   }
//
//   Future<void> getGeneralNews() async {
//     articles = await NewsService(Dio()).getNews();
//     isLoading = false;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? const SliverToBoxAdapter(
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           )
//         : SliverList(
//             delegate: SliverChildBuilderDelegate(childCount: articles.length,
//                 (context, index) {
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 22),
//               child: NewsTile(
//                 articleModel: articles[index],
//               ),
//             );
//           }));
//   }
// }
