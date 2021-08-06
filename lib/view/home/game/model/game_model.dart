import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'game_model.g.dart';

@JsonSerializable()
class GameModel extends INetworkModel<GameModel> {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;
  GameModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  @override
  GameModel fromJson(Map<String, dynamic> json) {
    return _$GameModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
   return  _$GameModelToJson(this);
  }
}
