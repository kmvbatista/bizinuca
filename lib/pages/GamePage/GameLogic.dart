import 'package:bizinuca/Repositories/StatisticsRepository.dart';
import 'package:bizinuca/models/MatchModel.dart';
import 'package:bizinuca/models/UserModel.dart';

class GameLogic {
  static Future postGame(List<UserModel> users, WinnerSide winnerSide) {
    var winners = _getWinners(users, winnerSide);
    var game = new MatchPostModel(
        players: users,
        valuePoints: 200,
        date: DateTime.now(),
        winners: winners,
        expectedPoints: _getExpectedPoints(users));
    return StatisticsRepository.postGame(game);
  }

  static int _getExpectedPoints(List<UserModel> users) {
    var pointsDifference = (users[0].points + users[1].points) -
        (users[2].points + users[3].points);
    return pointsDifference.abs().round();
  }

  static List<UserModel> _getWinners(
      List<UserModel> users, WinnerSide winnerSide) {
    if (winnerSide == WinnerSide.LeftSide) {
      return users.sublist(0, 2).map((user) => user).toList();
    } else {
      return users.sublist(2, 4).map((user) => user).toList();
    }
  }
}

enum WinnerSide { LeftSide, RightSide }
