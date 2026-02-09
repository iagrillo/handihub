import 'package:flutter/material.dart';
import '../models/artisan.dart';

class ArtistCard extends StatelessWidget {
  final Artisan artisan;
  final VoidCallback? onTap;
  const ArtistCard({required this.artisan, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: artisan.profileImageUrl != null
            ? CircleAvatar(backgroundImage: NetworkImage(artisan.profileImageUrl!))
            : CircleAvatar(child: Icon(Icons.person)),
        title: Text(artisan.fullName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(artisan.category),
            if (artisan.bio != null) Text(artisan.bio!),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
