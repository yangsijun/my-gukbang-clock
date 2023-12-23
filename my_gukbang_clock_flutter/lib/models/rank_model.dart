import 'package:my_gukbang_clock_flutter/models.dart';

enum Rank {
  beforeEnlistment,
  airmanBasic,
  airman,
  airmanFirstClass,
  seniorAirman,
  staffSergeant,
  citizen
}

class RankModel {
  static RankModel? _instance;

  static RankModel get instance {
    _instance ??= RankModel();
    return _instance!;
  }

  DateTime airmanDate = DateTime(2023, 5, 26);
  DateTime airmanFirstClassDate = DateTime(2023, 6, 24);
  DateTime seniorAirmanDate = DateTime(2023, 12, 24);
  DateTime staffSergeantDate = DateTime(2024, 6, 24);

  RankModel();

  ClockModel clockModel = ClockModel.instance;
  GukbangClockModel gukbangClockModel = GukbangClockModel.instance;

  Stream<Rank> get rankStream => clockModel.dateTimeStream.map(
    (now) {
      final enlistmentDate = gukbangClockModel.enlistmentDate;
      final dischargeDate = gukbangClockModel.dischargeDate;

      if (now.isBefore(enlistmentDate)) {
        return Rank.beforeEnlistment;
      } else if (now.isBefore(airmanDate)) {
        return Rank.airmanBasic;
      } else if (now.isBefore(airmanFirstClassDate)) {
        return Rank.airman;
      } else if (now.isBefore(seniorAirmanDate)) {
        return Rank.airmanFirstClass;
      } else if (now.isBefore(staffSergeantDate)) {
        return Rank.seniorAirman;
      } else if (now.isBefore(dischargeDate)) {
        return Rank.staffSergeant;
      } else {
        return Rank.citizen;
      }
    }
  );
}