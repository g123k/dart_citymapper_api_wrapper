class TravelTimes {
  final int? bikeTimeMinutes;
  final int? transitTimeMinutes;
  final int? scooterTimeMinutes;
  final int? motorsScooterTimeMinutes;
  final int? walkTimeMinutes;

  TravelTimes({
    required this.bikeTimeMinutes,
    required this.motorsScooterTimeMinutes,
    required this.scooterTimeMinutes,
    required this.transitTimeMinutes,
    required this.walkTimeMinutes,
  });

  @override
  String toString() {
    return 'TravelTimes{bikeTimeMinutes: $bikeTimeMinutes, transitTimeMinutes: $transitTimeMinutes, scooterTimeMinutes: $scooterTimeMinutes, motorsScooterTimeMinutes: $motorsScooterTimeMinutes, walkTimeMinutes: $walkTimeMinutes}';
  }
}
