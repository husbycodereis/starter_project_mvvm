import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'social_user_model.g.dart';

@JsonSerializable()
class SocialUser extends INetworkModel<SocialUser> {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  SocialUser({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  @override
  SocialUser fromJson(Map<String, dynamic> json) {
    return _$SocialUserFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$SocialUserToJson(this);
  }
}
