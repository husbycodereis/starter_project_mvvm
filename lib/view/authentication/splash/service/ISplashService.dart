import 'package:starter_project/view/authentication/splash/model/force_update_model.dart';
import 'package:vexana/vexana.dart';

part 'splash_service.dart';

abstract class ISplashService {
  final INetworkManager manager;
  ISplashService({
    required this.manager,
  });

  Future<ForceUpdateModel?> checkDeviceVersion({required String version, required String platform});
  ForceUpdateModel checkDeviceVersionMock({required String version, required String platform});
}

enum SplashServiceQuery { VERSION, PLATFORM }

extension SplashServiceQueryExtension on SplashServiceQuery {
  MapEntry<String, dynamic> toMapValue(String value) {
    switch (this) {
      case SplashServiceQuery.PLATFORM:
        return MapEntry('platform', value);
      case SplashServiceQuery.VERSION:
        return MapEntry('version', value);
    }
  }
}
