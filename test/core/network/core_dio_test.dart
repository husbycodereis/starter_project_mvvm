import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:starter_project/core/components/models/query/user_query_enum.dart';

import 'package:vexana/vexana.dart';
import 'dio_mock_model.dart';

void main() {
  late INetworkManager networkManager;
  setUp(() {
    networkManager =
        NetworkManager(isEnableLogger: true, options: BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
  });
  test('CoreDio List', () async {
    final data = await networkManager.send<PostModel, List<PostModel>>('/posts',
        queryParameters: {UserQueryEnum.ALBUMID.rawValue: 1}, method: RequestType.GET, parseModel: PostModel());
    expect(data.data!.first.userId, 1);
  });
  test('CoreDio List Photos', () async {
    final data = await networkManager.send<SocialUser, List<SocialUser>>('/photos',
        method: RequestType.GET, parseModel: SocialUser());
    expect(data.data, isList);
  });
}
