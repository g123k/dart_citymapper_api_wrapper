enum WalkingDirectionsProfile {
  fast,
  mainRoads,
}

extension WalkingDirectionsProfileExt on WalkingDirectionsProfile {
  String get value {
    switch (this) {
      case WalkingDirectionsProfile.fast:
        return 'fast';
      case WalkingDirectionsProfile.mainRoads:
        return 'main_roads';
    }
  }
}
