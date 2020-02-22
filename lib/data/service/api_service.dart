import 'package:chopper/chopper.dart';
import 'package:network_example/data/entity/new_feed.dart';
import 'package:network_example/data/service/contrant/network_constant.dart';
import 'package:network_example/util/serializable/json_serializable.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: "/posts")
abstract class ApiService extends ChopperService {

  @Get()
  Future<Response<List<NewFeed>>> getPosts();

  static final converter =
      JsonSerializableConverter({NewFeed: NewFeed.fromJson});

  static ApiService create() {
    final client = ChopperClient(
        baseUrl: BASE_URL, services: [_$ApiService()], converter: converter);

    return _$ApiService(client);
  }
}
