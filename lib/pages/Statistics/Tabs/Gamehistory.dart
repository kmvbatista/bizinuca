import 'package:bizinuca/models/MatchModel.dart';
import 'package:bizinuca/services/FeedBackService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GameHistory extends StatefulWidget {
  final List<MatchModel> _gameList;
  final String _username;

  GameHistory(this._gameList, this._username);
  @override
  _GameHistoryState createState() => _GameHistoryState();
}

class _GameHistoryState extends State<GameHistory> {
  List<DataRow> _dataRows;

  @override
  void initState() {
    super.initState();
    getDataRows();
  }

  TextStyle getWinnerPlayersTextStyle(winnerPlayers) {
    if (winnerPlayers.contains(widget._username))
      return TextStyle(fontWeight: FontWeight.bold, color: Colors.green);
    return TextStyle(fontWeight: FontWeight.bold, color: Colors.red);
  }

  getDataRows() {
    setState(() {
      _dataRows = widget._gameList
          .map((game) => DataRow(cells: [
                DataCell(
                  Text(game.date),
                  onTap: () => FeedBackService.showAlertDialog(context,
                      " Na partida jogaram ${game.players[0]} e ${game.players[1]} contra ${game.players[2]} e ${game.players[3]}."),
                ),
                DataCell(
                  Text("${game.winnerPlayers[0]} e ${game.winnerPlayers[1]}",
                      style: getWinnerPlayersTextStyle(game.winnerPlayers)),
                  onTap: () => FeedBackService.showAlertDialog(context,
                      " Na partida jogaram ${game.players[0]} e ${game.players[1]} contra ${game.players[2]} e ${game.players[3]}."),
                )
              ]))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _dataRows == null
          ? SpinKitCircle(
              color: Theme.of(context).primaryColor,
              size: 50.0,
            )
          : ListView(
              padding: EdgeInsets.all(10),
              children: <Widget>[
                Text(
                  "Clique em um jogo para ver os jogadores!",
                  style: Theme.of(context).textTheme.headline,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text("Data e hora"),
                      ),
                      DataColumn(
                        label: Text(
                          "Vencedores",
                        ),
                      ),
                    ],
                    rows: _dataRows,
                  ),
                ),
              ],
            ),
    );
  }
}
