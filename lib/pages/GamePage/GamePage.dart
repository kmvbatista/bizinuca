import 'package:bizinuca/components/primary_button.dart';
import 'package:bizinuca/models/user_model.dart';
import 'package:bizinuca/services/FeedBackService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Repositories/UserRepository.dart';
import '../../components/Menu.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

import 'CustomWidgets/UsersDropdown.dart';
import 'GameLogic.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<DropdownMenuItem<UserModel>> _usersToDropdown;
  List<UserModel> _usersToPlay;
  bool isGameRunning = false;
  final int playersQuantity = 4;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoading = false;

  @override
  void initState() {
    getUsers();
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    BackButtonInterceptor.add(myInterceptor);
  }

  bool myInterceptor(bool stopDefaultButtonEvent) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return false;
  }

  @override
  void dispose() {
    super.dispose();
    BackButtonInterceptor.removeAll();
  }

  Future getUsers() {
    return UserRepository.getUsers().then((users) {
      _usersToPlay = new List<UserModel>();
      setState(() {
        for (var i = 0; i < playersQuantity; i++) {
          _usersToPlay.add(users[i]);
        }
        _usersToDropdown = getDropdownUsers(users);
      });
    });
  }

  List<DropdownMenuItem<UserModel>> getDropdownUsers(List<UserModel> users) {
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
      FeedBackService.showAlertDialog(
          context, "Não existem dois ${userRepeated.name}!");
    }
  }

  UserModel getUserRepeated() {
    for (var i = 0; i < playersQuantity - 1; i++) {
      var isUserRepeated =
          _usersToPlay.where((x) => x.id == _usersToPlay[i].id).length > 1;
      if (isUserRepeated) return _usersToPlay[i];
    }
    return null;
  }

  void announceVictory(String textDialog) {
    FeedBackService.showAlertDialog(context, textDialog);
  }

  void handleVictory(WinnerSide winnerSide) async {
    setState(() {
      isGameRunning = false;
      isLoading = true;
    });
    try {
      if (winnerSide == WinnerSide.LeftSide) {
        await GameLogic.postGame(_usersToPlay, WinnerSide.LeftSide);
        announceVictory(
            "${_usersToPlay[0].name} e ${_usersToPlay[1].name} venceram!");
      } else {
        await GameLogic.postGame(_usersToPlay, WinnerSide.RightSide);
        announceVictory(
            "${_usersToPlay[2].name} e ${_usersToPlay[3].name} venceram!");
      }
      getUsers();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      FeedBackService.showAlertDialog(
          context, "Houve um erro ao finalizar o jogo.");
      setState(() {
        isLoading = false;
      });
    }
  }

  void handleUserDropdown(UserModel selectedUser, {@required int userIndex}) {
    setState(() {
      _usersToPlay[userIndex] = selectedUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
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
                        style: Theme.of(context).textTheme.display1,
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
                                  Text(
                                    '${_usersToPlay[0].name} e ${_usersToPlay[1].name}',
                                    style: Theme.of(context).textTheme.display3,
                                  ),
                                  PrimaryButton(
                                      'Selecionar Vencedor',
                                      () => FeedBackService.showYesNoDialog(
                                              context, () {
                                            Navigator.of(context).pop();
                                            handleVictory(WinnerSide.LeftSide);
                                          }, "Confirmar Vencedor?"),
                                      Colors.black),
                                ],
                              )
                            : Column(
                                children: <Widget>[
                                  UsersDropDown(
                                      _usersToPlay[0],
                                      _usersToDropdown,
                                      (UserModel user) => handleUserDropdown(
                                          user,
                                          userIndex: 0)),
                                  UsersDropDown(
                                      _usersToPlay[1],
                                      _usersToDropdown,
                                      (UserModel user) => handleUserDropdown(
                                          user,
                                          userIndex: 1)),
                                ],
                              ),
                        isGameRunning
                            ? Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      "Jogo rolando...",
                                      style:
                                          Theme.of(context).textTheme.display3,
                                    ),
                                  ),
                                  Container(
                                    height: 80,
                                    width: 80,
                                    child: Image(
                                      fit: BoxFit.contain,
                                      alignment: Alignment.center,
                                      color: Colors.black,
                                      image: AssetImage('images/tacos.png'),
                                    ),
                                  ),
                                  PrimaryButton(
                                      "Cancelar",
                                      () => setState(() {
                                            this.isGameRunning = false;
                                          }),
                                      Colors.red)
                                ],
                              )
                            : (isLoading
                                ? FeedBackService.showSpinner(Colors.white)
                                : PrimaryButton(
                                    'Iniciar Jogo',
                                    startGame,
                                    Colors.black,
                                  )),
                        isGameRunning
                            ? Column(
                                children: <Widget>[
                                  Text(
                                    '${_usersToPlay[2].name} e ${_usersToPlay[3].name}',
                                    style: Theme.of(context).textTheme.display3,
                                  ),
                                  PrimaryButton(
                                    'Selecionar Vencedor',
                                    () => FeedBackService.showYesNoDialog(
                                        context, () {
                                      Navigator.of(context).pop();
                                      handleVictory(WinnerSide.RightSide);
                                    }, "Confirmar Vencedor?"),
                                    Colors.black,
                                  ),
                                ],
                              )
                            : Column(
                                children: <Widget>[
                                  UsersDropDown(
                                      _usersToPlay[2],
                                      _usersToDropdown,
                                      (UserModel user) => handleUserDropdown(
                                          user,
                                          userIndex: 2)),
                                  UsersDropDown(
                                      _usersToPlay[3],
                                      _usersToDropdown,
                                      (UserModel user) => handleUserDropdown(
                                          user,
                                          userIndex: 3)),
                                ],
                              )
                      ],
                    ),
                  ],
                ),
              ));
  }
}
