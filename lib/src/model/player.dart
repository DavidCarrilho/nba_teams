import 'package:nba_teams/src/model/team.dart';

class Player {
  int id;
  String firstName;
  String lastName;
  Team team;

  Player({
    this.id,
    this.firstName,
    this.lastName,
    this.team,
  });

  factory Player.fromJson(Map json) {
    return Player(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      team: Team.fromJson(json['team']),
    );
  }

  Map toJson() {
    return {
      "id": id,
      "first_name": firstName,
      "last_name": lastName,
    };
  }

  @override
  String toString() {
    return '{id: $id, first_name: $firstName, last_name: $lastName}';
  }
}
