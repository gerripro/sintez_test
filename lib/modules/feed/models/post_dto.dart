import 'package:json_annotation/json_annotation.dart';

part 'post_dto.g.dart';

@JsonSerializable()
class PostDto {
  final String id;
  final String title;
  final String content;
  final String? mediaUrl;

  /// unix timestamp
  final int creationDate;

  PostDto({
    required this.id,
    required this.title,
    required this.content,
    required this.mediaUrl,
    required this.creationDate,
  });

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostDtoToJson(this);

  String get datePosted {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(creationDate);

    String day = dateTime.day.toString().padLeft(2, '0');
    String month = dateTime.month.toString().padLeft(2, '0');
    String year = dateTime.year.toString();

    String formattedDate = '$day/$month/$year';
    return formattedDate;
  }
}
