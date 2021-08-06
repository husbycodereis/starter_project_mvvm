import 'package:flutter_test/flutter_test.dart';
import 'package:starter_project/core/components/models/query/user_query.dart';
import 'package:mockito/mockito.dart';
import 'package:vexana/vexana.dart';

import 'social_network_mock.dart';
import 'social_view_model_mock.dart';

void main() {
  late SocialBuildContext context;
  late SocialNetworkMock mockService;
  late INetworkManager networkManager;
  late SocialViewModelMock viewModelMock;
  late SocialViewModelFake viewModelFake;

  setUp(() {
    context = SocialBuildContext();
    networkManager = NetworkManager(options: BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
    mockService = SocialNetworkMock(networkManager);
    viewModelMock = SocialViewModelMock(mockService);
    viewModelFake = SocialViewModelFake(mockService);
  });
  test('Fetch User Id', () async {
    final response = await mockService.fetchUser(1, context);
    expect(response, isNotNull);
  });

  test('should check Fetch Photos returns values', () async {
    final response = await mockService.fetchUserHouseList(UserQuery(albumId: 1), context);

    expect(response, isNotNull);
  });

  test('should check fetch search query is called', () async {
    viewModelMock.fetchAllSearchQuery('text');
    verify(viewModelMock.fetchAllSearchQuery('text')).called(1);
  });

  test('should check isLoading is Called 2 times', () async {
    viewModelMock.isLoadingChange();
    await mockService.fetchUserHouseList(UserQuery(albumId: 1), context);
    viewModelMock.isLoadingChange();
    verify(viewModelMock.isLoadingChange()).called(2);
  });

  test('should check is fetchuserall works', () async {
    expect(viewModelFake.isLoading, false);
    await viewModelFake.fetchAllUsers();
    expect(viewModelFake.socialUserList, isNotEmpty);
    expect(viewModelFake.isLoading, false);
  });
}
