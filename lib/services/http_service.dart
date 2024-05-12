// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, avoid_print, prefer_interpolation_to_compose_strings

import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import '../model/app_config.dart';

class HTTPService {
  final GetIt getIt = GetIt.instance;

  late String _base_url;
  late String _api_key;

  HTTPService() {
    AppConfig _config = getIt.get<AppConfig>();
    _base_url = _config.BASE_API_URL;
    _api_key = _config.API_KEY;
  }

  Future<http.Response> get(String _path, {Map<String, dynamic>? query}) async {
    try {
      String url = '$_base_url$_path?api_key=$_api_key&language=en-US';
      if (query != null) {
        url += '&' + query.entries.map((e) => '${e.key}=${e.value}').join('&');
      }
      print("URL: $url");
      return await http.get(Uri.parse(url));
    } catch (e) {
      throw Exception('Unable to perform get request: $e');
    }
  }
}
