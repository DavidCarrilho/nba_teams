import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nba_teams/src/Controller/team_controller.dart';
import 'package:nba_teams/src/page_list.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerLazySingleton<TeamController>(() => TeamController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NBA TEAMS',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PageList(),
    );
  }
}
