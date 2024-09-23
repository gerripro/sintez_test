import 'package:uuid/uuid.dart';

class UuidGenerator {
  final Uuid _uuid = const Uuid();

  String generateUuid() => _uuid.v4();
}