// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_lesson_course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonDto _$LessonDtoFromJson(Map<String, dynamic> json) => LessonDto(
      json['_id'] as String,
      json['stt'] as int,
      json['course'] as String,
      json['code'] as String,
      json['title'] as String,
      json['description'] as String,
      json['vi_title'] as String,
      json['vi_description'] as String,
      json['image'] as String,
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['__v'] as int,
      json['isLastLearn'] as bool?,
      json['isLearned'] as bool?,
      json['isOpen'] as bool?,
      (json['words'] as List<dynamic>)
          .map((e) => WordDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LessonDtoToJson(LessonDto instance) => <String, dynamic>{
      '_id': instance.id,
      'stt': instance.stt,
      'course': instance.course,
      'code': instance.code,
      'title': instance.title,
      'description': instance.description,
      'vi_title': instance.vi_title,
      'vi_description': instance.vi_description,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'isLastLearn': instance.isLastLearn,
      'isLearned': instance.isLearned,
      'isOpen': instance.isOpen,
      'words': instance.words,
    };

WordDto _$WordDtoFromJson(Map<String, dynamic> json) => WordDto(
      json['_id'] as String,
      json['stt'] as int,
      json['code'] as String,
      json['lesson'] as String,
      json['picture'] as String,
      json['content'] as String,
      json['pinyin'] as String,
      json['position'] as String,
      json['trans'] as String,
      json['sentence'] as String,
      json['chinese_pinyin'] as String,
      json['pinyin_sentence'] as String,
      json['en_sentence'] as String,
      json['vi_sentence'] as String,
      json['hanzi'] as String,
      json['audio'] as String,
      json['__v'] as int,
      json['createdAt'] as String,
      json['updatedAt'] as String,
    );

Map<String, dynamic> _$WordDtoToJson(WordDto instance) => <String, dynamic>{
      '_id': instance.id,
      'stt': instance.stt,
      'code': instance.code,
      'lesson': instance.lesson,
      'picture': instance.picture,
      'content': instance.content,
      'pinyin': instance.pinyin,
      'position': instance.position,
      'trans': instance.trans,
      'sentence': instance.sentence,
      'chinese_pinyin': instance.chinese_pinyin,
      'pinyin_sentence': instance.pinyin_sentence,
      'en_sentence': instance.en_sentence,
      'vi_sentence': instance.vi_sentence,
      'hanzi': instance.hanzi,
      'audio': instance.audio,
      '__v': instance.v,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
