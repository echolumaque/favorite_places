import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/place.dart';

class UserPlaceNotifier extends StateNotifier<List<Place>> {
  UserPlaceNotifier() : super([]);

  void addPlace(String title, File image) {
    state = [...state, Place(title: title, image: image)];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlaceNotifier, List<Place>>(
        (ref) => UserPlaceNotifier());
