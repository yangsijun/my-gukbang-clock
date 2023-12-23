import 'package:my_gukbang_clock_flutter/models.dart';

class RankViewModel {
  static RankViewModel? _instance;

  static RankViewModel get instance {
    _instance ??= RankViewModel();
    return _instance!;
  }

  RankViewModel();

  RankModel rankModel = RankModel.instance;

  Stream<String> get rankString => rankModel.rankStream.map((rank) {
    switch (rank) {
      case Rank.beforeEnlistment:
        return '입대 전';
      case Rank.airmanBasic:
        return '훈련병';
      case Rank.airman:
        return '이병';
      case Rank.airmanFirstClass:
        return '일병';
      case Rank.seniorAirman:
        return '상병';
      case Rank.staffSergeant:
        return '병장';
      case Rank.citizen:
        return '민간인';
    }
  });
}