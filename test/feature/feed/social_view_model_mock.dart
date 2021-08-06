import 'package:flutter/material.dart';
import 'package:starter_project/view/home/social/model/social_user_model.dart';
import 'package:mockito/mockito.dart';

import 'package:starter_project/view/home/social/viewmodel/social_view_model.dart';

import 'social_network_mock.dart';

class SocialBuildContext extends Mock implements BuildContext {}

class SocialViewModelMock extends Mock implements SocialViewModel {
  SocialNetworkMock? mockService;
  SocialViewModelMock(
    this.mockService,
  );
}

class SocialViewModelFake extends Fake implements SocialViewModel {
  SocialNetworkMock? mockService;
  SocialViewModelFake(
    this.mockService,
  );

  @override
  BuildContext? context;

  @override
  bool isLoading = false;

  @override
  List<SocialUser> socialUserList = [];

  @override
  Future<void> fetchAllUsers() async {
    isLoadingChange();
    await Future.delayed(const Duration(seconds: 1));
    socialUserList = [SocialUser()];
    isLoadingChange();
  }

  @override
  void isLoadingChange() {
    isLoading = !isLoading;
  }
}
