import 'package:bizinuca/models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/GetUsersList.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<DropdownMenuItem<User>> _usersToDropdown;
  List<User> _usersToPlay;
  bool isGameRunning = false;

  @override
  void initState() {
    getUsers();
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  void getUsers() {
    UserService.getUsers().then((res) {
      setState(() {
        for (var i = 0; i < 4; i++) {
          _usersToPlay.add(_usersToDropdown[i].value);
        }
      });
    });
  }

  void startGame() {
    var userRepeated = getUserRepeated();
    if (userRepeated == null)
      setState(() {
        isGameRunning = true;
      });
    else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("Não existem dois ${userRepeated.name}!"),
            );
          });
    }
  }

  User getUserRepeated() {
    var users = new List<User>();
    users.add(_user1);
    users.add(_user2);
    users.add(_user3);
    users.add(_user4);
    for (var i = 0; i < users.length - 1; i++) {
      var isUserRepeated =
          users.where((x) => x.name == users[i].name).length > 1;
      if (isUserRepeated) return users[i];
    }
    return null;
  }

  void handleDropdown1(User selectedItem) {
    setState(() {
      _user1 = selectedItem;
    });
  }

  void handleDropdown2(User selectedItem) {
    setState(() {
      _user2 = selectedItem;
    });
  }

  void handleDropdown3(User selectedItem) {
    setState(() {
      _user3 = selectedItem;
    });
  }

  void handleDropdown4(User selectedItem) {
    setState(() {
      _user4 = selectedItem;
    });
  }

  void onLeftPlayersVictory() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("${_user1.name} e ${_user2.name} venceram!"),
          );
        });
  }

  void onRightPlayersVictory() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("${_user3.name} e ${_user4.name} venceram!"),
          );
        });
  }

  void handleVictory(String players) {
    Navigator.of(context).pop();
    if (players == "leftPlayers")
      onLeftPlayersVictory();
    else
      onRightPlayersVictory();
  }

  void showConfirmationDialog(String winnerPlayers) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Tens certeza?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Não"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                  child: Text("Sim"),
                  onPressed: () => handleVictory(winnerPlayers)),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Colors.green),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: Image.asset('images/bolas.png'),
            title: Text(
              "Bizinuca Challenge",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            trailing: Icon(Icons.dehaze, color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              isGameRunning
                  ? Column(
                      children: <Widget>[
                        Container(
                          child: Text('${_user1.name}, e ${_user2.name}'),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            child: MaterialButton(
                              splashColor: Colors.green,
                              child: Text("Venceu",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              color: Colors.black,
                              onPressed: () =>
                                  showConfirmationDialog("leftPlayers"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                            ))
                      ],
                    )
                  : Column(
                      children: <Widget>[
                        DropdownButton<User>(
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          value: _user1,
                          items: _usersToDropdown,
                          onChanged: handleDropdown1,
                        ),
                        DropdownButton<User>(
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          value: _user2,
                          items: _dropDownItems,
                          onChanged: handleDropdown2,
                        ),
                      ],
                    ),
              isGameRunning
                  ? Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text("Game is running...",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.center,
                            color: Colors.black,
                            image: AssetImage('images/tacos.png'),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: MaterialButton(
                              splashColor: Colors.green,
                              child: Text("Cancelar",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              color: Colors.red,
                              onPressed: () => setState(() {
                                this.isGameRunning = false;
                              }),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                            ))
                      ],
                    )
                  : Container(
                      margin: EdgeInsets.only(top: 20),
                      child: MaterialButton(
                        splashColor: Colors.green,
                        child: Text("Iniciar jogo",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                        color: Colors.black,
                        onPressed: startGame,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      )),
              isGameRunning
                  ? Column(
                      children: <Widget>[
                        Container(
                          child: Text('${_user3.name} e ${_user4.name}'),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            child: MaterialButton(
                              splashColor: Colors.green,
                              child: Text("Venceu",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              color: Colors.black,
                              onPressed: () =>
                                  showConfirmationDialog('rightPlayers'),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                            ))
                      ],
                    )
                  : Column(
                      children: <Widget>[
                        DropdownButton(
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          value: _user3,
                          items: _dropDownItems,
                          onChanged: handleDropdown3,
                        ),
                        DropdownButton(
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          value: _user4,
                          items: _dropDownItems,
                          onChanged: handleDropdown4,
                        ),
                      ],
                    )
            ],
          ),
          Row(),
        ],
      ),
    ));
  }
}
