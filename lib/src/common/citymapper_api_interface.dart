import 'package:citymapper/src/common/model/location.dart';
import 'package:citymapper/src/common/model/travel_times.dart';

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
}
