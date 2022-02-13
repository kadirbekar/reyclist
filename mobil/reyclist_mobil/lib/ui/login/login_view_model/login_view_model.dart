import 'package:flutter/widgets.dart';
import 'package:vexana/vexana.dart';

import '../model/login_model.dart';
import '../model/user_response_model.dart';
import '../service/login_service.dart';

enum ViewState { initial, loading, loaded, error }

class LoginViewModel extends ChangeNotifier with LoginServices {
  late final INetworkManager? _networkManager;
  late ViewState state;

  LoginViewModel({INetworkManager? manager}) {
    _networkManager = manager;
    state = ViewState.initial;
  }

  void updateState(ViewState state) {
    state = state;
    notifyListeners();
  }

  @override
  Future<UserResponseModel?> login(LoginModel model) async {
    updateState(ViewState.loading);
    //final response = await _loginService?.login(model);
    updateState(ViewState.loaded);
    //return response;
  }
}
