import 'package:flutter/material.dart';

class OverallStatistics extends StatefulWidget {
  int totalWonMatches;
  int wonMatchesThisMonth;
  int totalPlayedMatches;
  String mostWinnerPartner;
  OverallStatistics(this.mostWinnerPartner, this.totalPlayedMatches,
      this.totalWonMatches, this.wonMatchesThisMonth);

  @override
  _OverallStatisticsState createState() => _OverallStatisticsState();
}

class _OverallStatisticsState extends State<OverallStatistics> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 100,
          width: 100,
          child: Image.asset('images/presentation.png'),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Demais estatísticas",
          style: TextStyle(
              color: Colors.green,
              fontStyle: FontStyle.italic,
              fontSize: 20,
              fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "Total de jogos até hoje: ${widget.totalPlayedMatches}.",
                  style: TextStyle(fontSize: 15),
                ),
                Text("Jogos vencidos até hoje: ${widget.totalWonMatches}.",
                    style: TextStyle(fontSize: 15)),
                Text("Jogos vencidos esse mês: ${widget.wonMatchesThisMonth}.",
                    style: TextStyle(fontSize: 15)),
                Text(
                    "Paceiro com quem mais venceu: ${widget.mostWinnerPartner}.",
                    style: TextStyle(fontSize: 15))
              ],
            ),
          ),
        )
      ],
    );
  }
}
