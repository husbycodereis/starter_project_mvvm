// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) {
  return GameModel(
    albumId: json['albumId'] as int?,
    id: json['id'] as int?,
    title: json['title'] as String?,
    url: json['url'] as String?,
    thumbnailUrl: json['thumbnailUrl'] as String?,
  );
}

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
