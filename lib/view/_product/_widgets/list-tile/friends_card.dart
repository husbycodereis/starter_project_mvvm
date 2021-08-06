import 'package:flutter/material.dart';

import 'package:starter_project/core/extensions/context_extensions.dart';
import 'package:starter_project/core/extensions/string_extensions.dart';
import 'package:starter_project/core/init/lang/locale_keys.g.dart';
import 'package:starter_project/view/home/social/model/social_user_model.dart';

class FriendsCard extends StatelessWidget {
  final SocialUser user;
  final VoidCallback onPressed;
  const FriendsCard({
    Key? key,
    required this.user,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(user.url!)),
      title: Text(user.id.toString()),
      onTap: onPressed,
      subtitle: Text(user.title.toString()),
      trailing: ElevatedButton(
          onPressed: () {},
          child: Text(
            LocaleKeys.social_following.locale,
            style: context.textTheme.bodyText2!.copyWith(color: context.customColors.white),
          )),
    );
  }
}
