import 'package:dio/dio.dart';
import 'package:flutter_arduino/app/shared/configs/url_config.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LightService extends Disposable {
  Dio client;

  LightService() {
    client = Dio(BaseOptions(baseUrl: UrlConfig.baseUrl));
  }

  Future<bool> turnRedLightToState(String state) async {
    var result = await client.get('red/$state');
    return result.statusCode == 200;
  }

  @override
  void dispose() {}
}
