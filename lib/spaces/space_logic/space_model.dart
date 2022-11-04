import 'package:lander/spaces/space_views/listspace_screen.dart';


class SpaceModel {

  final String id;
  final String spaceName;
  final String spaceLocation;
  final double spaceLat;
  final double spaceLng;
  final double spacePrice;
  final RentType rentType;
  final int spaceBeds;
  final int spaceBathRoom;
  final int spaceArea;
  final String spaceDescription;
  final AdType adType;
  final String categoryId;
  final List<String> spaceImgs;
  bool isFav;

  SpaceModel(this.id, this.spaceArea, this.adType, this.categoryId, this.rentType, this.spaceBathRoom, this.spaceBeds,
  this.spaceDescription, this.spaceLat, this.spaceLng, this.spaceLocation, this.spaceName, this.spacePrice, this.spaceImgs, this.isFav
  );


  factory SpaceModel.fromMap(String id, Map<String, dynamic> data, bool isFav) {
    return SpaceModel(
      id, data['spaceArea'], data['adType'], data['categoryId'], data['rentType'], data['spaceBathRoom'], data['spaceBeds'],
      data['spaceDescription'], data['spaceLat'], data['spaceLng'], data['spaceLocation'], data['spaceName'], data['spacePrice'], data['spaceImgs'], isFav
    );
  }
}