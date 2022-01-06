import 'package:citymapper/src/common/model/location.dart';

class LocationRequest {
  final double latitude;
  final double longitude;

  const LocationRequest({
    required this.latitude,
    required this.longitude,
  });

  LocationRequest.fromLocation(Location location)
      : this(
          latitude: location.latitude,
          longitude: location.longitude,
        );

  @override
  String toString() {
    return '$latitude,$longitude';
  }
}
