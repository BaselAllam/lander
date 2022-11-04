import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lander/shared/shared_theme/shared_colors.dart';
import 'package:lander/shared/shared_theme/shared_fonts.dart';
import 'package:lander/spaces/space_logic/map_controller.dart';
import 'package:lander/spaces/space_logic/map_state.dart';



class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  @override
  void initState() {
    excuteFun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapController, MapStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: SharedColors.backGroundColor,
          body: buildBody(state)
        );
      }, 
    );
  }

  Widget buildBody(MapStates states) {
    if (states is IsMapLoadingState) {
      return CircularProgressIndicator();
    } else if (states is IsMapLoadingFinishedState) {
      return GoogleMap(
        initialCameraPosition: CameraPosition(
          zoom: 12,
          target: LatLng(states.latLng!.latitude, states.latLng!.longitude)
        ),
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        mapType: MapType.normal,
      );
    } else {
      return Center(child: Text('Some thing went wrong', style: SharedFonts.blackFont,));
    }
  }

  excuteFun() {
    BlocProvider.of<MapController>(context).userLocation();
  }
}