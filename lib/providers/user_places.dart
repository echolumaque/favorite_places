import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/place.dart';

class UserPlaceNotifier extends StateNotifier<List<Place>> {
  UserPlaceNotifier() : super([]);

  void addPlace(String title) {
    state = [...state, Place(title: title)];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlaceNotifier, List<Place>>(
        (ref) => UserPlaceNotifier());
