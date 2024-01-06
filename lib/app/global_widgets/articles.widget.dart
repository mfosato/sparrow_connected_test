import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:sparrow_connected_test/app/data/model/article.model.dart';
import 'package:sparrow_connected_test/app/global_widgets/article_image.widget.dart';
import 'package:sparrow_connected_test/app/modules/news_details/views/news_details_view.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;
  const ArticleWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(NewsDetailsView(article: article));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [BoxShadow(blurRadius: 10, spreadRadius: 2, color: Colors.grey)]),
        child: Column(children: [
          Stack(
            children: [
              ArticleImage(url: article.urlToImage ?? ''),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      DateFormat.yMMMd().format(DateTime.parse(article.publishedAt!).toLocal()),
                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                    )),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title ?? 'No title',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, height: 1),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text("Source: ${article.source?.name ?? 'None'}")
              ],
            ),
          )
        ]),
      ),
    );
  }
}
