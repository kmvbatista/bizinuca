import 'package:bizinuca/models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../services/GetUsersList.dart';
import '../../components/Menu.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<DropdownMenuItem<User>> _usersToDropdown;
  List<User> _usersToPlay;
  bool isGameRunning = false;
  final int playersQuantity = 4;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
    UserService.getUsers().then((users) {
      _usersToPlay = new List<User>();
      setState(() {
        for (var i = 0; i < playersQuantity; i++) {
          _usersToPlay.add(users[i]);
        }
        _usersToDropdown = getDropdownUsers(users);
      });
    });
  }

  List<DropdownMenuItem<User>> getDropdownUsers(List<User> users) {
    return users
        .map((user) =>
            new DropdownMenuItem(value: user, child: Text('${user.name}')))
        .toList();
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
    for (var i = 0; i < playersQuantity - 1; i++) {
      var isUserRepeated =
          _usersToPlay.where((x) => x.id == _usersToPlay[i].id).length > 1;
      if (isUserRepeated) return _usersToPlay[i];
    }
    return null;
  }

  void handleDropdown1(User selectedUser) {
    setState(() {
      _usersToPlay[0] = selectedUser;
    });
  }

  void handleDropdown2(User selectedUser) {
    setState(() {
      _usersToPlay[1] = selectedUser;
    });
  }

  void handleDropdown3(User selectedUser) {
    setState(() {
      _usersToPlay[2] = selectedUser;
    });
  }

  void handleDropdown4(User selectedUser) {
    setState(() {
      _usersToPlay[3] = selectedUser;
    });
  }

  void onLeftPlayersVictory() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
                "${_usersToPlay[0].name} e ${_usersToPlay[1].name} venceram!"),
          );
        });
  }

  void onRightPlayersVictory() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
                "${_usersToPlay[2].name} e ${_usersToPlay[3].name} venceram!"),
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
        key: _scaffoldKey,
        backgroundColor: Colors.green,
        drawer: Menu(),
        body: _usersToPlay == null
            ? SpinKitCircle(
                color: Colors.white,
                size: 50.0,
              )
            : Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF66BB6A),
                      Color(0xFF388E3C),
                      Color(0xFF1B5E20),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "Bizinuca Challenge",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: FlatButton(
                        child: Icon(
                          Icons.dehaze,
                          color: Colors.black,
                        ),
                        onPressed: () => _scaffoldKey.currentState.openDrawer(),
                      ),
                      trailing: Image.asset('images/billiards.png'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        isGameRunning
                            ? Column(
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      '${_usersToPlay[0].name} e ${_usersToPlay[1].name}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: MaterialButton(
                                        splashColor: Colors.green,
                                        child: Text("Selecionar Vencedor",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white)),
                                        color: Colors.black,
                                        onPressed: () => showConfirmationDialog(
                                            "leftPlayers"),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
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
                                    value: _usersToPlay[0],
                                    items: _usersToDropdown,
                                    onChanged: handleDropdown1,
                                  ),
                                  DropdownButton<User>(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    value: _usersToPlay[1],
                                    items: _usersToDropdown,
                                    onChanged: handleDropdown2,
                                  ),
                                ],
                              ),
                        isGameRunning
                            ? Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Text("Jogo rolando...",
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
                                                fontSize: 15,
                                                color: Colors.white)),
                                        color: Colors.red,
                                        onPressed: () => setState(() {
                                          this.isGameRunning = false;
                                        }),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      ))
                                ],
                              )
                            : Container(
                                margin: EdgeInsets.only(top: 20),
                                child: MaterialButton(
                                  splashColor: Colors.green,
                                  child: Text("Iniciar jogo",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white)),
                                  color: Colors.black,
                                  onPressed: startGame,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                )),
                        isGameRunning
                            ? Column(
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      '${_usersToPlay[2].name} e ${_usersToPlay[3].name}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: MaterialButton(
                                        splashColor: Colors.green,
                                        child: Text("Selecionar Vencedor",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white)),
                                        color: Colors.black,
                                        onPressed: () => showConfirmationDialog(
                                            'rightPlayers'),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
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
                                    value: _usersToPlay[2],
                                    items: _usersToDropdown,
                                    onChanged: handleDropdown3,
                                  ),
                                  DropdownButton(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    value: _usersToPlay[3],
                                    items: _usersToDropdown,
                                    onChanged: handleDropdown4,
                                  ),
                                ],
                              )
                      ],
                    ),
                  ],
                ),
              ));
  }
}
