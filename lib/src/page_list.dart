import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:nba_teams/src/Controller/team_controller.dart';
import 'package:nba_teams/src/model/team.dart';

final _teamController = GetIt.I.get<TeamController>();
final futureTeams = _teamController.listTeamApi;

class PageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NBA Teans',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Observer(
        builder: (_) {
          final List<Team> teams = futureTeams.result;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: teams.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey[200],
                  child: Text(
                    "G",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      // "ID",
                      teams[index].id.toString(),
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
                subtitle: Container(
                  child: Text(
                    // "First_name Last_name",
                    teams[index].city,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
