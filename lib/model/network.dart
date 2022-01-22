import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class NetworkUtil {
  final String url;

  NetworkUtil({required this.url});

  Future<dynamic> getData() async {
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        return decodedData;
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
