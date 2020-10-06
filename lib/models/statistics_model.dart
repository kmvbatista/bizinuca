import 'package:bizinuca/models/match_model.dart';
import 'points_per_day.dart';

class StatisticsModel {
  StatisticsModel(
    this.totalPlayedMatches,
    this.pointsPerDay,
    this.totalWonMatches,
    this.userMatches,
    this.wonMatchesThisMonth,
    this.mostWinnerPartner,
  );

  int totalWonMatches;
  int wonMatchesThisMonth;
  int totalPlayedMatches;
  List<MatchModel> userMatches;
  List<PointsPerDay> pointsPerDay;
  String mostWinnerPartner;
}
