import 'package:bizinuca/models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/GetUsersList.dart';

class Main extends StatefulWidget {
  const Main({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  List<DropdownMenuItem<User>> _dropDownItems;
  User _selectedItem1;
  User _selectedItem2;
  User _selectedItem3;
  User _selectedItem4;
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
        _dropDownItems = res;
        _selectedItem1 = res[0].value;
        _selectedItem2 = res[1].value;
        _selectedItem3 = res[2].value;
        _selectedItem4 = res[3].value;
      });
    });
  }

  void handleDropdown1(User selectedItem) {
    setState(() {
      _selectedItem1 = selectedItem;
    });
  }

  void handleDropdown2(User selectedItem) {
    setState(() {
      _selectedItem2 = selectedItem;
    });
  }

  void handleDropdown3(User selectedItem) {
    setState(() {
      _selectedItem3 = selectedItem;
    });
  }

  void handleDropdown4(User selectedItem) {
    setState(() {
      _selectedItem4 = selectedItem;
    });
  }

  void onLeftPlayersVictory() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
                "${_selectedItem1.name} e ${_selectedItem2.name} venceram!"),
          );
        });
  }

  void onRightPlayersVictory() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
                "${_selectedItem3.name} e ${_selectedItem4.name} venceram!"),
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
                          child: Text(
                              '${_selectedItem1.name}, e ${_selectedItem2.name}'),
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
                          value: _selectedItem1,
                          items: _dropDownItems,
                          onChanged: handleDropdown1,
                        ),
                        DropdownButton<User>(
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          value: _selectedItem2,
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
                        onPressed: () {
                          setState(() => isGameRunning = true);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      )),
              isGameRunning
                  ? Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                              '${_selectedItem3.name} e ${_selectedItem4.name}'),
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
                          value: _selectedItem3,
                          items: _dropDownItems,
                          onChanged: handleDropdown3,
                        ),
                        DropdownButton(
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          value: _selectedItem4,
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
