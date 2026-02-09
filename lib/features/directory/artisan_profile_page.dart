import 'package:flutter/material.dart';
import '../models/artisan.dart';

class ArtisanProfilePage extends StatelessWidget {
  final Artisan artisan;
  const ArtisanProfilePage({required this.artisan, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Artisan Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: artisan.profileImageUrl != null
                      ? NetworkImage(artisan.profileImageUrl!)
                      : null,
                  child: artisan.profileImageUrl == null ? Icon(Icons.person, size: 32) : null,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(artisan.fullName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    if (artisan.businessName != null) Text(artisan.businessName!),
                    Text(artisan.category, style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            if (artisan.bio != null) ...[
              Text('Bio:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(artisan.bio!),
              SizedBox(height: 8),
            ],
            if (artisan.address != null) ...[
              Text('Address:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(artisan.address!),
              SizedBox(height: 8),
            ],
            Text('Phone: ${artisan.phone}'),
            if (artisan.whatsapp != null) Text('WhatsApp: ${artisan.whatsapp}'),
            if (artisan.email != null) Text('Email: ${artisan.email}'),
            if (artisan.galleryImageUrls != null && artisan.galleryImageUrls!.isNotEmpty) ...[
              SizedBox(height: 16),
              Text('Gallery:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: artisan.galleryImageUrls!.length,
                  separatorBuilder: (_, __) => SizedBox(width: 8),
                  itemBuilder: (context, idx) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(artisan.galleryImageUrls![idx], width: 80, height: 80, fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
            SizedBox(height: 24),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Message'),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Hire'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
