import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_places.dart';
import '../screens/add_place.dart';
import '../widgets/places_list.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => AddPlaceScreen(),
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: PlacesList(places: userPlaces),
    );
  }
}
