import 'package:chopper/chopper.dart';

part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: 'https://api.openweathermap.org/data/2.5/weather')
abstract class PostApiService extends ChopperService {

  @Get(path: '?{q}&units=metric&appid=ab14f74264477285ae20a75ed821de46')
  Future<Response> getPost(@Query('q') String city);

  static PostApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://api.openweathermap.org/data/2.5/weather',
      services: [
        _$PostApiService(),
      ],
      converter: JsonConverter(),
    );
    return _$PostApiService(client);
  }
}

