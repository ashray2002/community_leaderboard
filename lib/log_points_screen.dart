import 'package:flutter/material.dart';
import 'user.dart';

class LogPointsScreen extends StatefulWidget {
  final List<User> users;

  LogPointsScreen({required this.users});

  @override
  _LogPointsScreenState createState() => _LogPointsScreenState();
}

class _LogPointsScreenState extends State<LogPointsScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pointsController = TextEditingController();

  void _logPoints() {
    final name = _nameController.text;
    final points = int.tryParse(_pointsController.text) ?? 0;

    final user = widget.users.firstWhere(
      (u) => u.name == name,
      orElse: () => User(name: name),
    );

    user.points += points;

    if (!widget.users.contains(user)) {
      widget.users.add(user);
    }

    _nameController.clear();
    _pointsController.clear();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log Points'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'User Name'),
            ),
            TextField(
              controller: _pointsController,
              decoration: InputDecoration(labelText: 'Points'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _logPoints,
              child: Text('Log Points'),
            ),
          ],
        ),
      ),
    );
  }
}
