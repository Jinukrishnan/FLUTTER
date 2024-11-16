import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String? _uid;
  String? _sid;

  String? get uid => _uid;
  String? get sid => _sid;

  void setUid(String uid) {
    _uid = uid;
    notifyListeners(); // Notifies widgets listening to this provider
  }
  void setSid(String sid) {
    _sid = sid;
    notifyListeners(); // Notifies widgets listening to this provider
  }
}
