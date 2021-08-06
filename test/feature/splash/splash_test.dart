import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:starter_project/core/init/network/vexana_manager.dart';
import 'package:starter_project/view/authentication/splash/service/ISplashService.dart';

void main() {
  late ISplashService splashService;
  setUp(() {
    splashService = SplashService(VexanaManager.instance.networkManager);
  });

  test('Fetch Device Information', () async {
    final response = splashService.checkDeviceVersionMock(version: '1.0.0', platform: '1');
    log(response.currentVersion!);
    expect(response, isNotEmpty);
  });
}
