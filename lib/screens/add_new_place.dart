import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/saved_places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewPlaceScreen extends ConsumerStatefulWidget {
  const AddNewPlaceScreen({super.key});

  @override
  ConsumerState<AddNewPlaceScreen> createState() => _AddNewPlaceScreenState();
}

class _AddNewPlaceScreenState extends ConsumerState<AddNewPlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _enteredName = '';

  void savePlace() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
    ref
        .read(savedPlacesProvider.notifier)
        .savePlace(Place(name: _enteredName!));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Place'),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  label: Text('Title'),
                ),
                validator: (value) {
                  return value == null || value.isEmpty
                      ? 'A place needs a name'
                      : null;
                },
                onSaved: (value) {
                  _enteredName = value;
                },
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 120,
                height: 45,
                child: ElevatedButton(
                  onPressed: savePlace,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      Text('Add Place'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
