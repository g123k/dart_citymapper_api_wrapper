import 'package:citymapper/src/common/model/travel_time_type.dart';
import 'package:citymapper/src/network/model/request/travel_time_type_request.dart';

extension TravelTimeRequestExt on TravelTimeTypeRequest {
  String get value {
    switch (this) {
      case TravelTimeTypeRequest.walk:
        return 'walk';
      case TravelTimeTypeRequest.transit:
        return 'transit';
      case TravelTimeTypeRequest.bike:
        return 'bike';
      case TravelTimeTypeRequest.scooter:
        return 'scooter';
      case TravelTimeTypeRequest.motorScooter:
        return 'motorscooter';
    }
  }
}

extension TravelTimesExt on Iterable<TravelTimeTypeRequest> {
  String get value {
    return map((TravelTimeTypeRequest e) => e.value).join(',');
  }
}

extension TravelTimeExt on TravelTimeType {
  TravelTimeTypeRequest toTravelTime() {
    switch (this) {
      case TravelTimeType.walk:
        return TravelTimeTypeRequest.walk;
      case TravelTimeType.transit:
        return TravelTimeTypeRequest.transit;
      case TravelTimeType.bike:
        return TravelTimeTypeRequest.bike;
      case TravelTimeType.scooter:
        return TravelTimeTypeRequest.scooter;
      case TravelTimeType.motorScooter:
        return TravelTimeTypeRequest.motorScooter;
    }
  }
}
