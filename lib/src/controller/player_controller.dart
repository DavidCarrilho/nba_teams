import 'package:mobx/mobx.dart';
import 'package:nba_teams/src/model/player.dart';
import 'package:nba_teams/src/service/player_service.dart';

part 'player_controller.g.dart';

class PlayerController = _PlayerStoreBase with _$PlayerController;

abstract class _PlayerStoreBase with Store {
  _PlayerStoreBase() {
    fetchPlayers();
  }

  @observable
  ObservableFuture<List<Player>> listPlayerApi = ObservableFuture.value([]);

  final _api = PlayerService();
  List<Player> players;

  @action
  Future<void> refresh() async {
    return await fetchPlayers();
  }

  @observable
  bool errors = false;

  @action
  Future<void> fetchPlayers({nextPage: false}) async {
    if(!nextPage){
      players = await _api.fetchPlayers();
    }else{
      players += await _api.nextPage();
    }

    listPlayerApi = ObservableFuture.value(players);
  }
}
