import 'package:bizinuca/models/MatchModel.dart';
import 'PointsPerDay.dart';

class StatisticsModel {
  int totalWonMatches;
  int wonMatchesThisMonth;
  int totalPlayedMatches;
  List<MatchModel> userMatches;
  List<PointsPerDay> pointsPerDay;
  String mostWinnerPartner;

  StatisticsModel(
      this.totalPlayedMatches,
      this.pointsPerDay,
      this.totalWonMatches,
      this.userMatches,
      this.wonMatchesThisMonth,
      this.mostWinnerPartner);
}
