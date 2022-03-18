import 'package:jiffy/jiffy.dart';
import 'package:get/get.dart';

class DateTimeHelper{
  static String getDiffDuration(dynamic inputDate) => Jiffy(inputDate).fromNow().capitalizeFirst!;
}