
import 'package:json_annotation/json_annotation.dart';

part 'like_dto.g.dart';

@JsonSerializable()
class LikeDto {
  final String userId;
  final String postId;

  LikeDto({required this.userId, required this.postId});

  factory LikeDto.fromJson(Map<String, dynamic> json) => _$LikeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LikeDtoToJson(this);
}