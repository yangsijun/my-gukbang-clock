class GukbangClockModel {
  static GukbangClockModel? _instance;

  static GukbangClockModel get instance {
    _instance ??= GukbangClockModel();
    return _instance!;
  }
  
  GukbangClockModel();

  DateTime enlistmentDate = DateTime(2023, 4, 24, 0, 0, 0);
  DateTime dischargeDate = DateTime(2025, 1, 23, 0, 0, 0);
  double _percent = 0;

  double get percent => _percent;

  DateTime calculateGukbangTime(DateTime now) {
    calculateGukbangTimePercent(now);

    int hours = (percent * 24).floor();
    int minutes = ((percent * 24) % 1 * 60).floor();
    int seconds = (((percent * 24) % 1 * 60) % 1 * 60).floor();
    return DateTime(now.year, now.month, now.day, hours, minutes, seconds);
  }

  double calculateGukbangTimePercent(DateTime now) {
    final totalDuration = dischargeDate.difference(enlistmentDate);

    _percent = now.difference(enlistmentDate).inMilliseconds / totalDuration.inMilliseconds;

    if (_percent > 1) {
      _percent = 1;
    }

    return _percent;
  }
}