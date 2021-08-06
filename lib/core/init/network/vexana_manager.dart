import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instance;
  static VexanaManager? get instance {
    return _instance ??= VexanaManager.init();
  }

  VexanaManager.init();

  INetworkManager networkManager =
      NetworkManager(isEnableLogger: true, options: BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
  INetworkManager loginManager =
      NetworkManager(isEnableLogger: true, options: BaseOptions(baseUrl: 'https://reqres.in/api'));
}
