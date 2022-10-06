import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart';
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

  Future postFileRequest(String url, Map data, File file) async {
    try {
      var request = http.MultipartRequest("POST", Uri.parse(url));

      Stream<List<int>> stream = http.ByteStream(file.openRead());
      int length = await file.length();
      String? filename = basename(file.path);
      var multipartFile = http.MultipartFile(
        "image",
        stream,
        length,
        filename: filename,
      );

      request.files.add(multipartFile);
      data.forEach((key, value) {
        request.fields[key] = value;
      });

      var sendRequest = await request.send();

      var response = await http.Response.fromStream(sendRequest);

      if (sendRequest.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        log("error statusCode ${sendRequest.statusCode}");
      }
    } catch (e) {
      log("postFileRequest Error $e");
    }
  }
}
