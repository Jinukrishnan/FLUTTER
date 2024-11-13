import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String? _uid;

  String? get uid => _uid;

  void setUid(String uid) {
    _uid = uid;
    notifyListeners(); // Notifies widgets listening to this provider
  }
}
