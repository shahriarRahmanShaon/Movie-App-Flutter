import 'package:get/get.dart';

import '/app/data/remote/moviehub_remote_data_source.dart';
import '/app/data/remote/movieHub_remote_data_source_impl.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieHubRemoteDataSource>(
      () => GithubRemoteDataSourceImpl(),
      tag: (MovieHubRemoteDataSource).toString(),
    );
  }
}
