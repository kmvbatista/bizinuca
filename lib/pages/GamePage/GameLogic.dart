import 'package:bizinuca/Repositories/StatisticsRepository.dart';
import 'package:bizinuca/models/match_model.dart';
import 'package:bizinuca/models/user_model.dart';

class GameLogic {
  static Future postGame(List<UserModel> users, WinnerSide winnerSide) {
    final winnersLosers = _getWinnersLosers(users, winnerSide);
    final game = MatchPostModel(
        players: users,
        valuePoints: 200,
        date: DateTime.now(),
        winners: winnersLosers["winners"],
        losers: winnersLosers["losers"]);
    return StatisticsRepository.postGame(game);
  }

  static Map<String, List<UserModel>> _getWinnersLosers(
      List<UserModel> users, WinnerSide winnerSide) {
    if (winnerSide == WinnerSide.LeftSide) {
      return {"winners": users.sublist(0, 2), "losers": users.sublist(2, 4)};
    } else {
      return {"winners": users.sublist(2, 4), "losers": users.sublist(0, 2)};
    }
  }
}

enum WinnerSide { LeftSide, RightSide }
