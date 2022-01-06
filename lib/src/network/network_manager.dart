import 'dart:convert';

import 'package:citymapper/src/network/model/extensions.dart';
import 'package:citymapper/src/network/model/request/location_request.dart';
import 'package:citymapper/src/network/model/request/travel_time_type_request.dart';
import 'package:citymapper/src/network/model/response/travel_times_response.dart';
import 'package:citymapper/src/network/utils/network_uri_builder.dart';
import 'package:citymapper/src/network/utils/network_utils.dart';
import 'package:http/http.dart' as http;

class NetworkManager {
  static final String _baseUrl = 'https://api.external.citymapper.com/';
  static final String _basePath = '/api/1';

  final String apiKey;

  const NetworkManager(this.apiKey);

  Future<TravelTimesResponse> travelTimes(
    LocationRequest start,
    LocationRequest end, {
    Set<TravelTimeTypeRequest>? types,
  }) async {
    URIBuilder builder = URIBuilder(_baseUrl, _basePath, 'traveltimes')
      ..addQuery('start', start)
      ..addQuery('end', end);

    if (types != null && types.isNotEmpty) {
      builder.addQuery('traveltime_types', types.value);
    }

    http.Response response = await _sendGetRequest(builder);
    return TravelTimesResponse.fromJson(jsonDecode(response.body));
  }

  Future<http.Response> _sendGetRequest(URIBuilder builder) {
    return http.get(builder.build(), headers: {
      'Citymapper-Partner-Key': apiKey,
    }).then((http.Response value) {
      value.checkResponse();
      return value;
    });
  }
}
