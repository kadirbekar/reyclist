import 'dart:io';

import 'package:vexana/vexana.dart';

class NetworkSettings {
  static NetworkSettings? _instance;
  static NetworkSettings get instance => _instance ??= NetworkSettings._initialize();
  late final INetworkManager networkManager;

  final String _baseUrl = "https://reyclist.herokuapp.com";

  void initializeNetworkSettings() {
    networkManager = NetworkManager(
      options: BaseOptions(
        baseUrl: _baseUrl,
        contentType: ContentType.json.value,
      ),
    );
  }

  NetworkSettings._initialize();
}
