class Team {
  int id;
  String fullName;

  Team({
    this.id,
    this.fullName,
  });

  factory Team.fromJson(Map json) {
    return Team(
      id: json['id'],
      fullName: json['full_name'],
    );
  }

  Map toJson() {
    return {
      "id": id,
      "full_name": fullName,
    };
  }

  @override
  String toString() {
    return '{id: $id, full_name: $fullName,}';
  }
}
