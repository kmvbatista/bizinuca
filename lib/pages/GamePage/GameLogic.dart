import 'package:bizinuca/Repositories/StatisticsRepository.dart';
import 'package:bizinuca/models/Game.dart';
import 'package:bizinuca/models/User.dart';

class GameLogic {
  static Future recalculateUserPoints(List<User> users, WinnerSide winners) {
    var game = new GamePostModel(
        players: users,
        valuePoints: 200,
        date: DateTime.now(),
        winnerSide: winners,
        expectedPoints: _getExpectedPoints(users));
    return StatisticsRepository.postGame(game);
  }

  static int _getExpectedPoints(List<User> users) {
    var pointsDifference = (users[0].points + users[1].points) -
        (users[2].points + users[3].points);
    return pointsDifference.abs().round();
  }
}

enum WinnerSide { LeftSide, RightSide }
