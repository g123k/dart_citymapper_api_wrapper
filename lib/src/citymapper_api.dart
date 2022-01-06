import 'package:citymapper/src/common/citymapper_api_interface.dart';
import 'package:citymapper/src/network/model/request/location_request.dart';
import 'package:citymapper/src/network/model/request/travel_time_type_request.dart';
import 'package:citymapper/src/network/model/response/travel_times_response.dart';
import 'package:citymapper/src/network/network_manager.dart';

export 'package:citymapper/src/common/model/location.dart';
export 'package:citymapper/src/common/model/travel_time_type.dart';
export 'package:citymapper/src/common/model/travel_times.dart';

class CityMapperAPI {
  static final Map<String, CityMapperAPIInterface> _instances =
      <String, CityMapperAPIInterface>{};

  const CityMapperAPI._();

  static CityMapperAPIInterface get(String apiKey) {
    assert(apiKey.isNotEmpty);
    _instances[apiKey] ??= _CityMapperAPIInstance._(apiKey);
    return _instances[apiKey]!;
  }
}

class _CityMapperAPIInstance implements CityMapperAPIInterface {
  final NetworkManager _manager;

  _CityMapperAPIInstance._(String apiKey) : _manager = NetworkManager(apiKey);

  @override
  Future<TravelTimes> travelTimes(
    Location start,
    Location end, {
    bool walkTravelTime = true,
    bool transitTravelTime = true,
    bool bikeTravelTime = false,
    bool scooterTravelTime = false,
    bool motorScooterTravelTime = false,
  }) {
    return _manager.travelTimes(
      LocationRequest.fromLocation(start),
      LocationRequest.fromLocation(end),
      types: {
        if (walkTravelTime) TravelTimeTypeRequest.walk,
        if (transitTravelTime) TravelTimeTypeRequest.transit,
        if (bikeTravelTime) TravelTimeTypeRequest.bike,
        if (scooterTravelTime) TravelTimeTypeRequest.scooter,
        if (motorScooterTravelTime) TravelTimeTypeRequest.motorScooter,
      },
    ).then((TravelTimesResponse value) => value.toTravelTimes());
  }
}
