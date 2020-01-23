import 'package:bizinuca/models/MatchModel.dart';
import 'PointsPerDay.dart';

class StatisticsModel {
  String totalWonMatches;
  String wonMatchesThisMonth;
  String totalPlayedMatches;
  List<MatchModel> userMatches;
  List<PointsPerDay> pointsPerDay;

  StatisticsModel(this.totalPlayedMatches, this.pointsPerDay,
      this.totalWonMatches, this.userMatches, this.wonMatchesThisMonth);
}
