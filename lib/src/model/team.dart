class Team {
  int id;
  String city;

  Team({
    this.id,
    this.city,
  });

  factory Team.fromJson(Map json) {
    return Team(
      id: json['id'],
      city: json['city'],
    );
  }

  Map toJson() {
    return {
      "id": id,
      "city": city,
    };
  }

  @override
  String toString() {
    return '{id: $id, city: $city,}';
  }
}
