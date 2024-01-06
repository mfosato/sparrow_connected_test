import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:sparrow_connected_test/app/data/provider/api_provider.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyApiClient>(() => MyApiClient());
    Get.lazyPut<HomeController>(
      () => HomeController(apiClient: Get.find<MyApiClient>()),
    );
  }
}
