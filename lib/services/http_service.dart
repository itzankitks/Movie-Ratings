// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../model/app_config.dart';

class HTTPService {
  final Dio dio = Dio();
  final GetIt getIt = GetIt.instance;

  late String _base_url;
  late String _api_key;

  HTTPService() {
    AppConfig _config = getIt.get<AppConfig>();
    _base_url = _config.BASE_API_URL;
    _api_key = _config.API_KEY;
  }

  Future<Response> get(String _path, {Map<String, dynamic>? query}) async {
    try {
      String _url = '$_base_url$_path';
      Map<String, dynamic> _query = {
        'api_key': _api_key,
        'language': 'en-US',
      };
      // ignore: unnecessary_null_comparison
      if (query != null) {
        _query.addAll(query);
      }
      return await dio.get(_url, queryParameters: _query);
    } on DioException catch (e) {
      print('unable to perform get request');
      print('DioError: $e');
      rethrow;
    }
  }
}
