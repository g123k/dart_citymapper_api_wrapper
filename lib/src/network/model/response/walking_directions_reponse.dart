class WalkingDirectionsResponse {
  WalkingDirectionsResponse({
    required this.routes,
  });

  final List<Route> routes;

  factory WalkingDirectionsResponse.fromJson(Map<String, dynamic> json) =>
      WalkingDirectionsResponse(
        routes: List<Route>.from(json['routes'].map((x) => Route.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'routes': List<dynamic>.from(routes.map((x) => x.toJson())),
      };
}

class Route {
  Route({
    required this.start,
    required this.end,
    required this.durationSeconds,
    required this.legs,
    required this.signature,
  });

  final RouteLocation start;
  final RouteLocation end;
  final int durationSeconds;
  final List<Leg> legs;
  final String signature;

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        start: RouteLocation.fromJson(json['start']),
        end: RouteLocation.fromJson(json['end']),
        durationSeconds: json['duration_seconds'],
        legs: List<Leg>.from(json['legs'].map((x) => Leg.fromJson(x))),
        signature: json['signature'],
      );

  Map<String, dynamic> toJson() => {
        'start': start.toJson(),
        'end': end.toJson(),
        'duration_seconds': durationSeconds,
        'legs': List<dynamic>.from(legs.map((x) => x.toJson())),
        'signature': signature,
      };
}

class RouteLocation {
  RouteLocation({
    required this.coordinates,
  });

  final Coordinates coordinates;

  factory RouteLocation.fromJson(Map<String, dynamic> json) => RouteLocation(
        coordinates: Coordinates.fromJson(json['coordinates']),
      );

  Map<String, dynamic> toJson() => {
        'coordinates': coordinates.toJson(),
      };
}

class Coordinates {
  Coordinates({
    required this.lat,
    required this.lon,
  });

  final double lat;
  final double lon;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: json['lat'].toDouble(),
        lon: json['lon'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lon': lon,
      };
}

class Leg {
  Leg({
    required this.travelMode,
    required this.durationSeconds,
    required this.path,
    required this.instructions,
  });

  final String travelMode;
  final int durationSeconds;
  final String path;
  final List<Instruction> instructions;

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
        travelMode: json['travel_mode'],
        durationSeconds: json['duration_seconds'],
        path: json['path'],
        instructions: List<Instruction>.from(
            json['instructions'].map((x) => Instruction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'travel_mode': travelMode,
        'duration_seconds': durationSeconds,
        'path': path,
        'instructions': List<dynamic>.from(instructions.map((x) => x.toJson())),
      };
}

class Instruction {
  Instruction({
    required this.pathIndex,
    required this.descriptionText,
    required this.type,
    required this.distanceMeters,
    required this.timeSeconds,
    required this.typeDirection,
  });

  final int pathIndex;
  final String descriptionText;
  final Type type;
  final int? distanceMeters;
  final int? timeSeconds;
  final String? typeDirection;

  factory Instruction.fromJson(Map<String, dynamic> json) => Instruction(
        pathIndex: json['path_index'],
        descriptionText: json['description_text'],
        type: typeValues.map[json['type']]!,
        distanceMeters: json['distance_meters'],
        timeSeconds: json['time_seconds'],
        typeDirection: json['type_direction'],
      );

  Map<String, dynamic> toJson() => {
        'path_index': pathIndex,
        'description_text': descriptionText,
        'type': typeValues.reverse[type],
        'distance_meters': distanceMeters == null ? null : distanceMeters,
        'time_seconds': timeSeconds == null ? null : timeSeconds,
        'type_direction': typeDirection == null ? null : typeDirection,
      };
}

enum Type { DEPART, TURN, ARRIVE }

final typeValues = EnumValues(
    {'arrive': Type.ARRIVE, 'depart': Type.DEPART, 'turn': Type.TURN});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
