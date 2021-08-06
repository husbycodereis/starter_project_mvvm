import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/components/models/query/user_query.dart';
import '../../../../core/components/models/query/user_query_enum.dart';
import '../../../../core/components/utility/service_helper.dart';
import '../../../../core/constants/enums/network_route_enum.dart';
import '../model/social_user_model.dart';
import 'ISocialService.dart';

class SocialService extends ISocialService with ServiceHelper {
  SocialService(INetworkManager networkManager) : super(manager: networkManager);

  @override
  Future<SocialUser?> fetchUser(dynamic id, BuildContext context) async {
    final response = await manager.send<SocialUser, SocialUser>(NetWorkRoutes.PHOTOS.rawValue,
        parseModel: SocialUser(), urlSuffix: '/$id', method: RequestType.GET);
    showMessage(response.error, context);
    return response.data;
  }

  @override
  Future<List<SocialUser>> fetchUserHouseList(UserQuery query, BuildContext context) async {
    //ilkinde neyi parse edicem, ikincisinde neyi alicam
    final response = await manager.send<SocialUser, List<SocialUser>>(NetWorkRoutes.PHOTOS.rawValue,
        queryParameters: {UserQueryEnum.ALBUMID.rawValue: query.albumId},
        parseModel: SocialUser(),
        method: RequestType.GET);
    showMessage(response.error, context);
    return response.data ?? [];
  }

  @override
  Future<List<SocialUser>> fetchUserNameQuery(String text) {
    throw UnimplementedError();
  }
}
