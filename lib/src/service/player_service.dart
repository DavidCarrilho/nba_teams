import 'package:dio/dio.dart';
import 'package:nba_teams/src/model/player.dart';
import 'package:nba_teams/src/provider/dio_provider.dart';

class PlayerService {
  int _nextPage;
  final _dio = DioServiceProvider().dio;

  Future<List<Player>> fetchPlayers() async {
    try {
      Response response = await _dio.get('/players');
      return _decode(response);
    } on DioError catch (error) {
      throw error.response.statusCode;
    }
  }

    Future<List<Player>> nextPage() async {
    try {
      Response response = await _dio.get('/players', queryParameters: {'page': _nextPage});
      return _decode(response);
    } on DioError catch (error) {
      throw error.response.statusCode;
    }
  }

  List<Player> _decode(Response response) {
    if (response.statusCode == 200) {
      var decoded = response.data;
      _nextPage = decoded['meta']['next_page'];
      List<Player> players = decoded['data'].map<Player>((map) {
        return Player.fromJson(map);
      }).toList();
      return players;
    } else {
      throw Exception("Erro ao carregar Jogadores");
    }
  }
}
