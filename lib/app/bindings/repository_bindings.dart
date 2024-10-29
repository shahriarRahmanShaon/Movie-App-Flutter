import 'package:get/get.dart';

import '/app/data/repository/movie_repository.dart';
import '/app/data/repository/movie_repository_impl.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieRepository>(
      () => MovieRepositoryImpl(),
      tag: (MovieRepository).toString(),
    );
  }
}
