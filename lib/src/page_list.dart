import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:nba_teams/src/controller/player_controller.dart';
import 'package:nba_teams/src/model/player.dart';

class PageList extends StatelessWidget {
  final _playerController = GetIt.I.get<PlayerController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 0,
              expandedHeight: 100,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("NBA Teams",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
              ),
            ),
          ];
        },
        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {
              _playerController.fetchPlayers(nextPage: true);
            }
            return;
          },
          child: Container(
            color: Colors.white,
            child: Observer(
              builder: (_) {
                final futurePlayers = _playerController.listPlayerApi;
                final List<Player> players = futurePlayers.result;
                return GroupedListView<dynamic, String>(
                  elements: players,
                  groupBy: (player) => player.team.fullName,
                  groupComparator: (value1, value2) => value1.compareTo(value2),
                  order: GroupedListOrder.ASC,
                  useStickyGroupSeparators: true,
                  groupSeparatorBuilder: (team) => Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      child: Text(team),
                    ),
                  ),
                  itemBuilder: (c, player) {
                    return ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Theme.of(context).primaryColor,
                        backgroundColor: Colors.grey[200],
                        child: Text(
                          "${player.firstName[0]}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "${player.id}",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                      subtitle: Container(
                        child: Text(
                          "${player.firstName} ${player.lastName}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
