import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:starter_project/core/constants/enums/network_route_enum.dart';
import 'package:vexana/vexana.dart';

import 'login_mock_model.dart';

void main() {
  late INetworkManager networkManager;
  setUp(() {
    networkManager = NetworkManager(isEnableLogger: true, options: BaseOptions(baseUrl: 'https://reqres.in/api'));
  });
  test('Login Success', () async {
    final data = await networkManager.send<LoginMockResponseModel, LoginMockResponseModel>(NetWorkRoutes.LOGIN.rawValue,
        method: RequestType.POST,
        parseModel: LoginMockResponseModel(),
        data: LoginMockModel(email: 'eve.holt@reqres.in', password: 'cityslicka'));

    log(data.data!.token!);
    expect(data.data!.token, isNotEmpty);
  });
}
