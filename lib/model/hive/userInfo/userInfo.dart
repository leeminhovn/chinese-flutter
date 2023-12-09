import 'package:hive/hive.dart';

part 'userInfo.g.dart';

@HiveType(typeId: 0)
class UserInfo extends HiveObject {
  @HiveField(0)
  final String email;

  @HiveField(1)
  final String createdAt;
  @HiveField(2)
  final String name;

  @HiveField(3)
  final String? expired_day;
  UserInfo(
      {required this.email,
      required this.createdAt,
      required this.name,
      required this.expired_day});
}
