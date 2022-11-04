import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:lander/shared/shared_functions/shared_data.dart';
import 'package:lander/spaces/space_logic/category_model.dart';
import 'package:lander/spaces/space_logic/space_model.dart';
import 'package:lander/spaces/space_logic/space_states.dart';


class SpaceController extends Cubit<SpaceStates> {

  SpaceController() : super(InitialSpaceState());

  List<SpaceModel> _spaces = [];
  List<SpaceModel> get allSpaces => _spaces;

  List<SpaceModel> _wishlist = [];
  List<SpaceModel> get allWishlist => _wishlist;

  List<CategoryModel> _categories = [];
  List<CategoryModel> get allCategories => _categories;

  // user sapce section

  void userListedSpaces() async {
    http.Response res = await http.get(Uri.parse('$url/spaces.json'));
    Map data = json.decode(res.body);
    data.forEach((key, value) {
      _spaces.add(SpaceModel.fromMap(key, value, false));
    });
  }


  Future<bool> listSpace(Map<String, dynamic> spaceData) async {
    http.Response res = await http.post(
      Uri.parse('$url/spaces.json'),
      body: json.encode(spaceData)
    );
    if (res.statusCode == 200) {
      _spaces.add(SpaceModel.fromMap(json.decode(res.body)['name'], spaceData, false));
      return true;
    } else {
      return false;
    }
  }

  // category section

  void getCategories() async {
    http.Response res = await http.get(Uri.parse('$url/category.json'));
    Map data = json.decode(res.body);
    data.forEach((key, value) {
      _categories.add(CategoryModel.fromJson(key, value));
    });
  }

  // Wishlist section

  void getWishlist() async {
    http.Response res = await http.get(Uri.parse('$url/wishlist.json'));
    Map data = json.decode(res.body);
    data.forEach((key, value) {
      _wishlist.add(SpaceModel.fromMap(key, value, true));
    });
  }

  void addToWishlist(SpaceModel space) {
    space.isFav = true;
    _wishlist.add(space);
  }

  void removeFromWishlist(SpaceModel space) {
    for (int i = 0; i < _wishlist.length; i++) {
      if (space.id == _wishlist[i].id) {
        space.isFav = false;
        _wishlist.removeAt(i);
        break;
      }
    }
  }
}