import 'package:citymapper/src/common/model/location.dart';
import 'package:citymapper/src/common/model/travel_times.dart';
import 'package:citymapper/src/network/model/response/walking_directions_reponse.dart';

export 'package:citymapper/src/common/model/location.dart';
export 'package:citymapper/src/common/model/travel_time_type.dart';
export 'package:citymapper/src/common/model/travel_times.dart';

abstract class CityMapperAPIInterface {
  Future<TravelTimes> travelTimes(
    Location start,
    Location end, {
    bool walkTravelTime = true,
    bool transitTravelTime = true,
    bool bikeTravelTime = false,
    bool scooterTravelTime = false,
    bool motorScooterTravelTime = false,
  });

  Future<WalkingDirectionsResponse> walkingDirections(
    Location start,
    Location end, {
    String? language,
    bool? fastProfile = true,
    bool? mainRoadsProfile,
    String? rerouteSignature,
  });
}
