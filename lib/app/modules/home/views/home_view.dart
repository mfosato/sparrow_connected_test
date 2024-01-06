import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';
import 'package:sparrow_connected_test/app/data/model/article.model.dart';
import 'package:sparrow_connected_test/app/global_widgets/articles.widget.dart';
import 'package:sparrow_connected_test/app/global_widgets/empty_news.widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            'News',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.newsModel.value != null && controller.newsModel.value!.articles.isNotEmpty
              ? SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    for (Article article in controller.newsModel.value!.articles) ArticleWidget(article: article)
                  ]),
                )
              : const EmptyNewsWidget(),
        ));
  }
}
