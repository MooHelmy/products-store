import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("there error in state code ${response.statusCode}");
    }
  }

  Future<dynamic> post(
      {required String url, @required dynamic body, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there a problem with state code ${response.statusCode},with body${response.body}');
    }
  }

  Future<dynamic> put(
      {required String url, required dynamic body, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      print(body);
      print(url);
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there a problem with state code ${response.statusCode},with body${response.body}');
    }
  }
}
