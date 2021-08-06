import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/components/models/query/user_query.dart';
import '../model/social_user_model.dart';

abstract class ISocialService {
  final INetworkManager manager;

  ISocialService({
    required this.manager,
  });

  Future<List<SocialUser>> fetchUserHouseList(UserQuery query, BuildContext context);
  Future<List<SocialUser>> fetchUserNameQuery(String text);
  Future<SocialUser?> fetchUser(dynamic id, BuildContext context);
}
