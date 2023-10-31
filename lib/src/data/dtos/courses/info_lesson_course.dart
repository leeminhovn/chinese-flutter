import 'package:json_annotation/json_annotation.dart';

part 'info_lesson_course.g.dart';

double toDoubleFunc(String number) {
  return double.parse(number);
}

@JsonSerializable()
class LessonDto {
  @JsonKey(name: '_id')
  final String id;
  final int stt;
  final String course;
  final String code;
  final String title;
  final String description;
  final String vi_title;
  final String vi_description;
  final String image;

  final String createdAt;
  final String updatedAt;
  @JsonKey(name: '__v')
  final int v;
  final bool? isLastLearn;
  final bool? isLearned;
  final bool? isOpen;
  final List<WordDto> words;
  LessonDto(
      this.id,
      this.stt,
      this.course,
      this.code,
      this.title,
      this.description,
      this.vi_title,
      this.vi_description,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.isLastLearn,
      this.isLearned,
      this.isOpen,
      this.words);
  factory LessonDto.fromJson(Map<String, dynamic> json) {
    return _$LessonDtoFromJson(json);
  }
  Map<String, dynamic> toJson() => _$LessonDtoToJson(this);
}

@JsonSerializable()
class WordDto {
  @JsonKey(name: '_id')
  final String id;
  final int stt;
  final String code;
  final String lesson;
  final String picture;
  final String content;
  final String pinyin;
  final String position;
  final String trans;
  final String sentence;
  final String chinese_pinyin;
  final String pinyin_sentence;
  final String en_sentence;
  final String vi_sentence;
  final String hanzi;
  final String audio;
  @JsonKey(name: '__v')
  final int v;
  final String createdAt;
  final String updatedAt;
  WordDto(
      this.id,
      this.stt,
      this.code,
      this.lesson,
      this.picture,
      this.content,
      this.pinyin,
      this.position,
      this.trans,
      this.sentence,
      this.chinese_pinyin,
      this.pinyin_sentence,
      this.en_sentence,
      this.vi_sentence,
      this.hanzi,
      this.audio,
      this.v,
      this.createdAt,
      this.updatedAt);
  factory WordDto.fromJson(Map<String, dynamic> json) {
    return _$WordDtoFromJson(json);
  }
  Map<String, dynamic> toJson() => _$WordDtoToJson(this);
}
