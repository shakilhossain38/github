import 'package:http/http.dart' as http;

import '../resource/urls.dart';

enum ApiUrlType {
  login,
  signUp,
}

class ApiClient {
  http.Client httClient = http.Client();

  Future<http.Response> getRequest(String url, {bool isPublic = false}) async {
    var completeUrl = _buildUrl(url);
    var headers = await _getHeaders();
    return isPublic
        ? httClient.get(Uri.parse(completeUrl))
        : httClient.get(Uri.parse(completeUrl), headers: headers);
  }

  Future<Map<String, String>> _getHeaders() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return headers;
  }

  _buildUrl(String partialUrl) {
    String baseUrl = Urls.baseUrl;
    return baseUrl + partialUrl;
  }
}
