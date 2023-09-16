import 'package:flutter/material.dart';
import 'user.dart';
import 'log_points_screen.dart';
import 'leaderboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sustainable Leaderboard',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Sustainable Leaderboard'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Log Points'),
                Tab(text: 'Leaderboard'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              LogPointsScreen(users: users),
              LeaderboardScreen(users: users),
            ],
          ),
        ),
      ),
    );
  }
}
