import 'package:uuid/uuid.dart';

class GenId {
  GenId._();

  static final instance = GenId._();

  final Uuid _uid = const Uuid();

  String getUid() {
    final uid = _uid.v4();
    final id = uid.replaceAll('-', '');
    return id;
  }
}
