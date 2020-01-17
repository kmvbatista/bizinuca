import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/GetUsersList.dart';

class Main extends StatefulWidget {
  const Main({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  List<DropdownMenuItem<String>> _dropDownItems;
  String _selectedItem1;
  String _selectedItem2;
  String _selectedItem3;
  String _selectedItem4;

  @override
  void initState() {
    _dropDownItems = UsersList().getDropdownItems();
    _selectedItem1 = _dropDownItems[0].value;
    _selectedItem2 = _dropDownItems[0].value;
    _selectedItem3 = _dropDownItems[0].value;
    _selectedItem4 = _dropDownItems[0].value;
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  void handleDropdown1(String selectedItem) {
    setState(() {
      _selectedItem1 = selectedItem;
    });
  }

  void handleDropdown2(String selectedItem) {
    setState(() {
      _selectedItem2 = selectedItem;
    });
  }

  void handleDropdown3(String selectedItem) {
    setState(() {
      _selectedItem3 = selectedItem;
    });
  }

  void handleDropdown4(String selectedItem) {
    setState(() {
      _selectedItem4 = selectedItem;
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
              Column(
                children: <Widget>[
                  DropdownButton(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    value: _selectedItem1,
                    items: _dropDownItems,
                    onChanged: handleDropdown1,
                  ),
                  DropdownButton(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    value: _selectedItem2,
                    items: _dropDownItems,
                    onChanged: handleDropdown2,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: MaterialButton(
                        splashColor: Colors.green,
                        child: Text("Venceu",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                        color: Colors.black,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      )),
                ],
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
              Column(
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
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: MaterialButton(
                        splashColor: Colors.green,
                        child: Text("Venceu",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                        color: Colors.black,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      )),
                ],
              ),
            ],
          ),
          Row(),
        ],
      ),
    ));
  }
}
