import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class BackendServices {
  Future getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log("getRequest Error $e");
    }
  }

  Future postRequest(String url, Map data) async {
    try {
      var response = await http.post(
        Uri.parse(url),
        body: data,
      );
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log("getRequest Error $e");
    }
  }
}
