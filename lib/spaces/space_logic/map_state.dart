

import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapStates {}

class IsMapLoadingState extends MapStates {}

class IsMapLoadingFinishedState extends MapStates {

  LatLng? latLng;

  IsMapLoadingFinishedState(this.latLng);
}

class InitialMapState extends MapStates {

  LatLng latLng = LatLng(30.0444, 31.2357);
}