import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sparrow_connected_test/app/data/model/news.model.dart';
import 'package:sparrow_connected_test/app/data/provider/api_provider.dart';

class HomeController extends GetxController {
  final MyApiClient apiClient;
  HomeController({required this.apiClient});

  Rx<NewsModel?> newsModel = Rx(null);

  @override
  void onInit() {
    getAllNews();
    super.onInit();
  }

  Future<void> getAllNews() async {
    EasyLoading.show(status: 'Getting all news...');
    final res = await apiClient.getAllNews();
    res.fold((l) {
      EasyLoading.showError(l.failureData);
    }, (r) {
      newsModel.value = r;
      EasyLoading.showSuccess('Successfully loaded all news...');
    });
  }
}
