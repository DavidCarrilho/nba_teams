import 'package:mobx/mobx.dart';
import 'package:nba_teams/src/model/team.dart';
import 'package:nba_teams/src/service/team_service.dart';

part 'team_controller.g.dart';

class TeamController = _TeamStoreBase with _$TeamController;

abstract class _TeamStoreBase with Store {

  @observable
  ObservableFuture<List<Team>> listTeamApi = ObservableFuture.value([]);

  final _api = TeamService();

  @action
  Future<void> refresh() async {
    return await fecthTeam();
  }

  @observable
  bool loading = false;

  @observable
  bool errors = false;

  // ignore: missing_return
  Future<List<Team>> fecthTeam() async {
    var data = await _api.fetchTeams();
    listTeamApi = ObservableFuture.value(data);
  }
}
