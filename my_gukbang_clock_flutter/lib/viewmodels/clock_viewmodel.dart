import 'package:my_gukbang_clock_flutter/models.dart';
import 'package:intl/intl.dart';

class ClockViewModel {
  static ClockViewModel? _instance;

  static ClockViewModel get instance {
    _instance ??= ClockViewModel(model: ClockModel.instance);
    return _instance!;
  }

  final ClockModel model;

  ClockViewModel({required this.model});

  Stream<String> get dateTime => model.dateTimeStream.map((dt) {
    final ms = dt.millisecond ~/ 10;
    return DateFormat('yyyy년 M월 d일 HH:mm:ss.${ms.toString().padLeft(2, "0")}').format(dt);
  });
}