import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:school_app/common/data/network/base_api_services.dart';
import '../exceptions/app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print("GET URL: $url");
    }

    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10));
      return returnResponse(response);
    } on SocketException {
      throw InternetException("No Internet Connection");
    } on TimeoutException {
      throw RequestTimeoutException("Request Timed Out");
    } on FormatException {
      throw FetchDataException("Bad response format");
    } catch (e) {
      throw FetchDataException("Unexpected error: $e");
    }
  }

  @override
  Future<dynamic> postApi(dynamic data, String url) async {
    if (kDebugMode) {
      print("POST URL: $url");
      print("POST DATA: $data");
    }

    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      return returnResponse(response);
    } on SocketException {
      throw InternetException("No Internet Connection");
    } on TimeoutException {
      throw RequestTimeoutException("Request Timed Out");
    } on FormatException {
      throw FetchDataException("Bad response format");
    } catch (e) {
      throw FetchDataException("Unexpected error: $e");
    }
  }

  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print("STATUS CODE: ${response.statusCode}");
      print("BODY: ${response.body}");
    }

    switch (response.statusCode) {
      case 200:
      case 400:
        try {
          return jsonDecode(response.body);
        } catch (e) {
          throw FetchDataException("Failed to parse response");
        }

      default:
        throw FetchDataException(
          "Error while communicating with server: ${response.statusCode}",
        );
    }
  }
}
