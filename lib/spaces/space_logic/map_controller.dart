import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:lander/spaces/space_logic/map_state.dart';



class MapController extends Cubit<MapStates> {

  MapController() : super(InitialMapState());

  LatLng? _latLng = LatLng(30.0444, 31.2357);

  Future<void> userLocation() async {

    emit(IsMapLoadingState());
    try {
      Position position = await Geolocator.getCurrentPosition();
      _latLng = LatLng(position.latitude, position.longitude);
    } catch (e) {}
    emit(IsMapLoadingFinishedState(_latLng));
  }

  Future<void> searchLocation(String searchWord) async {
    emit(IsMapLoadingState());
    try {
      List<Location> locations = await locationFromAddress(searchWord);
      if (locations.isNotEmpty) _latLng = LatLng(locations[0].latitude, locations[0].longitude);
    } catch (e) {}
    emit(IsMapLoadingFinishedState(_latLng));
  }
}

// share data ( approach at the top of the app widget tree ( Material App ))
// notifyListener ( to be used inside the ( logic code ) to notify with any change happen )
    // additional note
        // notifylistener in Bloc isnot a method like provider & scoped model its a class
// rebuild screen ( to be used as a parent for the widget that need to be rerenderd )

// BlocProvider ( to create a new Cubit Obj )
// BlocBuilder ( to rerender the widget that listen to changes )
// BlocLisetener ( to rerender the widget that stream to changes )