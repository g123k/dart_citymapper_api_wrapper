import 'package:citymapper/citymapper.dart';

void main() async {
  var api = await CityMapperAPI.get(
    'QGW8fQFCyHv7Sk8FRtHk4G8XfY7WL8iW',
  );

  var travelTimes = api.travelTimes(
    Location(
      latitude: 51.525246,
      longitude: 0.084672,
    ),
    Location(
      latitude: 51.559098,
      longitude: 0.074503,
    ),
    transitTravelTime: true,
    walkTravelTime: true,
    bikeTravelTime: true,
    scooterTravelTime: true,
    motorScooterTravelTime: false,
  );
}
