import 'package:flutter/material.dart';

class LocatinInput extends StatefulWidget {
  const LocatinInput({super.key});

  @override
  State<LocatinInput> createState() => _LocatinInputState();
}

class _LocatinInputState extends State<LocatinInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 170,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color:
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
            ),
          ),
          child: Text(
            'No location chosen',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Get Current Location'),
              onPressed: () {},
            ),
            TextButton.icon(
              icon: Icon(Icons.map),
              label: Text('Select on Map'),
              onPressed: () {},
            )
          ],
        ),
      ],
    );
  }
}
