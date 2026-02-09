import 'package:flutter/material.dart';

class ArtisanCard extends StatelessWidget {
  final String name;
  final String category;
  final String bio;

  const ArtisanCard({
    required this.name,
    required this.category,
    required this.bio,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text('$category\n$bio'),
      ),
    );
  }
}
