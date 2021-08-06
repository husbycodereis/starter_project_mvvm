part of 'ISplashService.dart';

class SplashService extends ISplashService {
  final String path = 'version';
  SplashService(INetworkManager manager) : super(manager: manager);

  @override
  Future<ForceUpdateModel?> checkDeviceVersion({required String version, required String platform}) async {
    final response = await manager.send<ForceUpdateModel, ForceUpdateModel>(path,
        parseModel: ForceUpdateModel(),
        method: RequestType.GET,
        queryParameters: Map.fromEntries(
            [SplashServiceQuery.VERSION.toMapValue(version), SplashServiceQuery.PLATFORM.toMapValue(platform)]));
    return response.data;
  }

  @override
  ForceUpdateModel checkDeviceVersionMock({required String version, required String platform}) {
    return ForceUpdateModel(isForceUpdate: false, currentVersion: version, type: 'major, platform: $platform');
  }
}
