// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDto _$PostDtoFromJson(Map<String, dynamic> json) => PostDto(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      mediaUrl: json['mediaUrl'] as String?,
      creationDate: (json['creationDate'] as num).toInt(),
    );

Map<String, dynamic> _$PostDtoToJson(PostDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'mediaUrl': instance.mediaUrl,
      'creationDate': instance.creationDate,
    };
