import 'package:my_gukbang_clock_flutter/models.dart';

class DDayModel {
  static DDayModel? _instance;

  static DDayModel get instance {
    _instance ??= DDayModel();
    return _instance!;
  }

  DDayModel();

  ClockModel clockModel = ClockModel.instance;
  GukbangClockModel gukbangClockModel = GukbangClockModel.instance;

  Stream<int> get dDayStream => clockModel.dateTimeStream.map(
    (now) {
      final dischargeDate = gukbangClockModel.dischargeDate;

      int daysBetween = (dischargeDate.difference(now).inHours / 24).round();
      
      if (daysBetween < 0) {
        daysBetween = 0;
      }

      return daysBetween;
    }
  );
}