import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Page')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Manage Artisans'),
            subtitle: Text('Approve, reject, or edit artisan profiles.'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.analytics),
            title: Text('View Analytics'),
            subtitle: Text('See platform usage and stats.'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
