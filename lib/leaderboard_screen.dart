import 'package:flutter/material.dart';
import 'user.dart';

class LeaderboardScreen extends StatelessWidget {
  final List<User> users;

  LeaderboardScreen({required this.users});

  @override
  Widget build(BuildContext context) {
    // Sort users by points in descending order
    users.sort((a, b) => b.points.compareTo(a.points));

    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text('${user.points} points'),
          );
        },
      ),
    );
  }
}
