import 'package:uuid/uuid.dart';

class IdUtil {
  static const Uuid uuid = Uuid();

  // Generates a UUID v4
  static String generateId() {
    return uuid.v4();
  }
}
