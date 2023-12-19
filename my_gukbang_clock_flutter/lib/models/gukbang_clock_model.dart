import 'package:my_gukbang_clock_flutter/models.dart';

class GukbangClockModel {
  static GukbangClockModel? _instance;

  static GukbangClockModel get instance {
    _instance ??= GukbangClockModel();
    return _instance!;
  }
  
  GukbangClockModel();

  ClockModel clockModel = ClockModel.instance;
  DateTime enlistmentDate = DateTime(2023, 4, 24, 0, 0, 0);
  DateTime dischargeDate = DateTime(2025, 1, 23, 0, 0, 0);
  double _percent = 0;

  double get percent => _percent;

  Stream<DateTime> get gukbangTimeStream => clockModel.dateTimeStream.map(
    (_) {
      final now = clockModel.now;
      double percent = calculateGukbangTimePercent(now);

      int hours = (percent * 24).floor();
      int minutes = ((percent * 24) % 1 * 60).floor();
      int seconds = (((percent * 24) % 1 * 60) % 1 * 60).floor();
      return DateTime(now.year, now.month, now.day, hours, minutes, seconds);
    }
  );

  double calculateGukbangTimePercent(DateTime now) {
    final totalDuration = dischargeDate.difference(enlistmentDate);

    _percent = now.difference(enlistmentDate).inMilliseconds / totalDuration.inMilliseconds;

    if (_percent > 1) {
      _percent = 1;
    }

    return _percent;
  }
}