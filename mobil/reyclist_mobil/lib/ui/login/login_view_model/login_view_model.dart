import 'package:flutter/widgets.dart';
import 'package:reyclist_mobil/ui/login/model/user_model.dart';

enum ViewState { initial, loading, loaded, error }

class UserContext extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  void setUserData(User? user) {
    _user = user;
    notifyListeners();
  }
}
