import 'package:get/get.dart';
import '/app/modules/search/controllers/search_controller.dart' as searchController;

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<searchController.SearchController>(
      () => searchController.SearchController(),
    );
  }
}
