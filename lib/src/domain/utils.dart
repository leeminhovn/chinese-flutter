import 'package:MochiChinese/core/constant/user_enum.dart';

class DateTimeHelp {
  static AccountSubscriptionStatus checkExpired(String expired) {
    List<String> arrayDate = expired.split("-");

    int year = int.parse(arrayDate[0]);
    int month = int.parse(arrayDate[1]);
    int day = int.parse(arrayDate[2]);
    DateTime dateNeedCheck = DateTime(year, month, day);
    DateTime dateNow = DateTime.now();
    if (dateNow.isAfter(dateNeedCheck)) {
      return AccountSubscriptionStatus.freeAccount;
    }
    return AccountSubscriptionStatus.premiumAccount;
  }

  static String convertIsoTimeFormatToAsiaTimeFormat(
      String isoTimeNeedConvert) {
    DateTime dateTime = DateTime.parse(isoTimeNeedConvert);

    // Format the DateTime object into the desired format (yyyy-MM-dd)

    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  static String convertEuropeTimeFormatToAsiaTimeFormat(
      String europeTimeNeedConvert) {
    DateTime dateTime = DateTime.parse(europeTimeNeedConvert);

    // Format the DateTime object into the desired format (yyyy-MM-dd)

    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
}
