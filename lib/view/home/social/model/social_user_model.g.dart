// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialUser _$SocialUserFromJson(Map<String, dynamic> json) {
  return SocialUser(
    albumId: json['albumId'] as int?,
    id: json['id'] as int?,
    title: json['title'] as String?,
    url: json['url'] as String?,
    thumbnailUrl: json['thumbnailUrl'] as String?,
  );
}

Map<String, dynamic> _$SocialUserToJson(SocialUser instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
