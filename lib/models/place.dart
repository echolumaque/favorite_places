import 'package:uuid/uuid.dart';

class Place {
  Place({required this.title}) : id = Uuid().v4();

  final String id;
  final String title;
}
