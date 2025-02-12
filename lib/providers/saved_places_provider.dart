import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/place.dart';

class SavedPlacesProvider extends StateNotifier<List<Place>> {
  SavedPlacesProvider() : super([]);

  void savePlace(Place place) {
    state = [...state, place];
  }
}

final savedPlacesProvider =
    StateNotifierProvider<SavedPlacesProvider, List<Place>>(
        (ref) => SavedPlacesProvider());
