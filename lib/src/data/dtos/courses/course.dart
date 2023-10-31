import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

double toDoubleFunc(String number) {
  return double.parse(number);
}

@JsonSerializable()
class CourseDto {
  @JsonKey(name: '_id')
  final String id;
  final int stt;
  final String code;
  final String title;
  final String description;
  final String vi_title;
  final String vi_description;
  final String outcome;
  final String image;
  final String public_status;
  final String active_language;
  final String createdAt;
  final String updatedAt;
  final bool isData;
  CourseDto(
      this.id,
      this.stt,
      this.code,
      this.title,
      this.description,
      this.vi_title,
      this.vi_description,
      this.outcome,
      this.image,
      this.public_status,
      this.active_language,
      this.createdAt,
      this.updatedAt,
      this.isData);
  factory CourseDto.fromJson(Map<String, dynamic> json) {
    return _$CourseDtoFromJson(json);
  }
  Map<String, dynamic> toJson() => _$CourseDtoToJson(this);
}
