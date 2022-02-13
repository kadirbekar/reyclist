import 'package:reyclist_mobil/ui/login/model/login_model.dart';
import 'package:reyclist_mobil/ui/login/model/user_response_model.dart';
import 'package:vexana/vexana.dart';

mixin LoginServices {
  Future<UserResponseModel?> login(LoginModel model);
}

abstract class ILoginService with LoginServices {
  late final INetworkManager _networkManager;
  INetworkManager get manager => _networkManager;
  ILoginService(INetworkManager manager) {
    _networkManager = manager;
  }
}

class LoginService extends ILoginService {
  LoginService(INetworkManager manager) : super(manager);

  final String _authenticationPath = "/api/authentication";

  @override
  Future<UserResponseModel?> login(LoginModel model) async {
    final response = await manager.send<UserResponseModel, UserResponseModel>("$_authenticationPath/login",
        parseModel: UserResponseModel(), method: RequestType.POST, data: model);

    return response.data;
  }
}
