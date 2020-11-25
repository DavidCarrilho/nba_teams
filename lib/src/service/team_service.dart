import 'package:dio/dio.dart';
import 'package:nba_teams/src/model/team.dart';
import 'package:nba_teams/src/provider/dio_provider.dart';

class TeamService {
  final _dio = DioServiceProvider().dio;

  Future<List<Team>> fetchTeams() async {
    try {
      Response response = await _dio.get('/teams');
      return _decode(response);
    } on DioError catch (error) {
      throw error.response.statusCode;
    }
  }

  List<Team> _decode(Response response) {
    if (response.statusCode == 200) {
      var decoded = response.data;
      List<Team> team = decoded.map<Team>((map) {
        return Team.fromJson(map);
      }).toList();
      return team;
    } else {
      throw Exception("Erro ao carregar times");
    }
  }
}
