import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_places.dart';
import '../widgets/image_input.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _enteredName = '';

  void _savePlace() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
    ref.read(userPlacesProvider.notifier).addPlace(_enteredName!);

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
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  return value == null || value.isEmpty
                      ? 'A place needs a name'
                      : null;
                },
                onSaved: (value) {
                  _enteredName = value;
                },
              ),
              SizedBox(height: 10),
              ImageInput(),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _savePlace,
                icon: Icon(Icons.add),
                label: Text('Add Place'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
