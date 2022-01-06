import 'package:citymapper/src/common/citymapper_api_interface.dart';
import 'package:citymapper/src/network/model/response/base_response.dart';

class TravelTimesResponse extends BaseNetworkResponse {
  final int? bikeTimeMinutes;
  final int? transitTimeMinutes;
  final int? scooterTimeMinutes;
  final int? motorsScooterTimeMinutes;
  final int? walkTimeMinutes;

  TravelTimesResponse({
    required this.bikeTimeMinutes,
    required this.motorsScooterTimeMinutes,
    required this.scooterTimeMinutes,
    required this.transitTimeMinutes,
    required this.walkTimeMinutes,
    String? message,
    String? errorCode,
  }) : super(
          message: message,
          errorCode: errorCode,
        );

  factory TravelTimesResponse.fromJson(Map<String, dynamic> json) =>
      TravelTimesResponse(
        transitTimeMinutes: json["transit_time_minutes"],
        bikeTimeMinutes: json["bike_time_minutes"],
        scooterTimeMinutes: json["scooter_time_minutes"],
        walkTimeMinutes: json["walk_travel_time_minutes"],
        motorsScooterTimeMinutes: json["motorscooter_time_minutes"],
        message: json["message"],
        errorCode: json["error_code"],
      );

  TravelTimes toTravelTimes() {
    if (hasError) {
      throw Exception(generateErrorReadableString());
    }

    return TravelTimes(
      bikeTimeMinutes: bikeTimeMinutes,
      transitTimeMinutes: transitTimeMinutes,
      scooterTimeMinutes: scooterTimeMinutes,
      motorsScooterTimeMinutes: motorsScooterTimeMinutes,
      walkTimeMinutes: walkTimeMinutes,
    );
  }
}
