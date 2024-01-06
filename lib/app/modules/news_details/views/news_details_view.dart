import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../controllers/news_details_controller.dart';
import 'package:sparrow_connected_test/app/data/model/article.model.dart';
import 'package:sparrow_connected_test/app/global_widgets/back_button.widget.dart';
import 'package:sparrow_connected_test/app/global_widgets/article_image.widget.dart';

class NewsDetailsView extends GetView<NewsDetailsController> {
  final Article article;

  const NewsDetailsView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        primary: false,
        child: Column(
          children: [
            Stack(
              children: [
                ArticleImage(url: article.urlToImage ?? ''),
                const BackButtonWidget(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Source: ${article.source?.name}',
                        style: const TextStyle(fontSize: 10),
                      ),
                      Text(
                        DateFormat.yMMMd().format(DateTime.parse(article.publishedAt!).toLocal()),
                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    article.title ?? 'No title',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(article.description ?? ''),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(article.content ?? 'No content'),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Author: ${article.author}',
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
