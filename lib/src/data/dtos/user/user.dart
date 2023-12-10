import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserDto {
  final String name;
  final String email;
  String? expired_day;
  String createdAt;
  TokensDto? tokens;

  UserDto(this.name, this.email, this.expired_day, this.createdAt, this.tokens);
  factory UserDto.fromJson(Map<String, dynamic> json) {
    return _$UserDtoFromJson(json);
  }
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}

@JsonSerializable()
class TokensDto {
  final String accessToken;
  final int exp__accessToken;
  final String refreshToken;
  final int exp__refreshToken;
  TokensDto(this.accessToken, this.exp__accessToken, this.refreshToken,
      this.exp__refreshToken);
  factory TokensDto.fromJson(Map<String, dynamic> json) {
    return _$TokensDtoFromJson(json);
  }
  Map<String, dynamic> toJson() => _$TokensDtoToJson(this);
}
