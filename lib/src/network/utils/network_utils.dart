import 'dart:convert';

import 'package:citymapper/src/network/model/response/base_response.dart';
import 'package:http/http.dart';

extension ResponseExtension on Response {
  void checkResponse() {
    if (statusCode == 429) {
      throw APIRateLimitReachedException(body);
    } else if (statusCode == 401) {
      BaseNetworkResponse response = BaseNetworkResponse.fromJson(
        jsonDecode(body),
      );

      if (response.message == 'Invalid authentication credentials') {
        throw InvalidAPIKeyException();
      }
    } else if (statusCode != 200) {
      throw NetworkException(
          value: BaseNetworkResponse.fromJson(
        jsonDecode(body),
      ));
    }
  }
}

class NetworkException implements Exception {
  final dynamic value;

  NetworkException({this.value});

  @override
  String toString() {
    if (value is BaseNetworkResponse) {
      return (value as BaseNetworkResponse).generateErrorReadableString();
    }

    return value;
  }
}

class APIRateLimitReachedException extends NetworkException {
  APIRateLimitReachedException(value) : super(value: value);

  @override
  String toString() {
    return 'Your API key has reached its limit!';
  }
}

class InvalidAPIKeyException extends NetworkException {
  InvalidAPIKeyException() : super();

  @override
  String toString() {
    return 'Invalid API key!';
  }
}
