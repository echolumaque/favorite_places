import 'dart:io';
import 'package:uuid/uuid.dart';

class Place {
  Place({
    required this.title,
    required this.image,
  }) : id = Uuid().v4();

  final String id;
  final String title;
  final File image;
}
