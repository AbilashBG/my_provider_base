import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import '../enums.dart';

mixin ApiHelper {
  final String baseUrl = "https://fakestoreapi.com/";
  String? authToken;

  void setAuthToken(String token) {
    authToken = token;
  }

  Future<dynamic> request(
      {required RequestType type,
      required String endpoint,
      Map<String, dynamic>? data,
      Map<String, String>? headers,
      bool showToast = false}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    if (kDebugMode) {
      print("Url is $url");
      if (data != null) {
        print(jsonEncode(data));
      }
    }
    final defaultHeaders = {
      'Content-Type': 'application/json',
      if (authToken != null) 'Authorization': 'Bearer $authToken',
    };

    final combinedHeaders =
        headers != null ? {...defaultHeaders, ...headers} : defaultHeaders;

    http.Response response;

    try {
      switch (type) {
        case RequestType.get:
          response = await http.get(url, headers: combinedHeaders);
          break;
        case RequestType.post:
          response = await http.post(url,
              headers: combinedHeaders, body: jsonEncode(data));
          break;
        case RequestType.put:
          response = await http.put(url,
              headers: combinedHeaders, body: jsonEncode(data));
          break;
        case RequestType.patch:
          response = await http.patch(url,
              headers: combinedHeaders, body: jsonEncode(data));
          break;
        case RequestType.delete:
          response = await http.delete(url,
              headers: combinedHeaders, body: jsonEncode(data));
          break;
        case RequestType.multipart:
          var request = http.MultipartRequest('POST', url);
          request.headers.addAll(combinedHeaders);

          /// Add multipart logic here if needed
          var streamedResponse = await request.send();
          response = await http.Response.fromStream(streamedResponse);
          break;
        default:
          throw Exception('Invalid request type');
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(response.body);
      } else {
        _handleError(response.statusCode, showToast);
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      if (showToast) {
        _showToast("Failed to execute request: $e");
      }
      throw Exception('Failed to execute request: $e');
    }
  }

  void _handleError(int statusCode, bool showToast) {
    String errorMessage;

    switch (statusCode) {
      case 400:
        errorMessage = 'Bad Request';
        break;
      case 401:
        errorMessage = 'Unauthorized';
        break;
      case 403:
        errorMessage = 'Forbidden';
        break;
      case 404:
        errorMessage = 'Not Found';
        break;
      case 500:
        errorMessage = 'Internal Server Error';
        break;
      case 503:
        errorMessage = 'Service Unavailable';
        break;
      default:
        errorMessage = 'Unknown Error: $statusCode';
    }

    if (showToast) {
      _showToast(errorMessage);
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
