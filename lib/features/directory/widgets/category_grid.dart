import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  final List<String> categories;
  const CategoryGrid({required this.categories, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: categories.map((cat) => Card(child: Center(child: Text(cat)))).toList(),
    );
  }
}
