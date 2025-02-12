import 'package:favorite_places/providers/saved_places_provider.dart';
import 'package:favorite_places/screens/add_new_place.dart';
import 'package:favorite_places/screens/place_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavedPlacesScreen extends ConsumerStatefulWidget {
  const SavedPlacesScreen({super.key});

  @override
  ConsumerState<SavedPlacesScreen> createState() => _SavedPlacesScreenState();
}

class _SavedPlacesScreenState extends ConsumerState<SavedPlacesScreen> {
  @override
  Widget build(BuildContext context) {
    final savedPlaces = ref.watch(savedPlacesProvider);
    Widget content = Center(
      child: Text(
        'No places added yet',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    );

    if (savedPlaces.isNotEmpty) {
      content = ListView.builder(
        itemCount: savedPlaces.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
              style: TextButton.styleFrom(
                alignment: Alignment.centerLeft,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => PlaceInfoScreen(
                      place: savedPlaces[index],
                    ),
                  ),
                );
              },
              child: Text(
                savedPlaces[index].name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => AddNewPlaceScreen(),
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
