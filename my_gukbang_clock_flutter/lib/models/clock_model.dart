class ClockModel {
  static ClockModel? _instance;

  static ClockModel get instance {
    _instance ??= ClockModel();
    return _instance!;
  }

  ClockModel();

  DateTime _now = DateTime.now();

  Stream<DateTime> get dateTimeStream => Stream<DateTime>.periodic(
    const Duration(milliseconds: 10),
    (_) {
      _now = DateTime.now();
      return _now;
    },
  );

  DateTime get now => _now;
}