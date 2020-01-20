import 'package:bizinuca/Repositories/UserRepository.dart';
import 'package:bizinuca/models/User.dart';

class GameLogic {
  static Future recalculateUserPoints(List<User> users, WinnerSide winnerSide) {
    var expectedPoints = _getExpectedPoints(users);
    if (winnerSide == WinnerSide.LeftSide) {
      users[0].points += expectedPoints;
      users[1].points += expectedPoints;
      users[2].points -= expectedPoints;
      users[3].points -= expectedPoints;
    } else {
      users[3].points += expectedPoints;
      users[2].points += expectedPoints;
      users[1].points -= expectedPoints;
      users[0].points -= expectedPoints;
    }
    return UserRepository.updateUsers(users);
  }

  static int _getExpectedPoints(List<User> users) {
    var pointsDifference = (users[0].points + users[1].points) -
        (users[2].points + users[3].points);
    return pointsDifference.abs().round();
  }
}

enum WinnerSide { LeftSide, RightSide }
