import 'package:flutter/material.dart';
import '../models/artisan.dart';
import 'artist_card.dart';

class DirectoryPage extends StatelessWidget {
  DirectoryPage({Key? key}) : super(key: key);

  // Example mock data
  final List<Artisan> artisans = [
    Artisan(
      id: '1',
      fullName: 'Israel Grillo',
      businessName: 'Prime Plumbing',
      phone: '08012345678',
      whatsapp: '08012345678',
      category: 'Plumber',
      bio: 'Experienced plumber with 10+ years in Lagos.',
      address: '12, Adeniran Ogunsanya Street, Lagos',
      state: 'Lagos',
      city: 'Surulere',
      status: 'approved',
      isAvailable: true,
      email: 'israel@example.com',
      profileImageUrl: null,
      galleryImageUrls: null,
      isFeatured: false,
      createdAt: null,
      tradetype: null,
    ),
    Artisan(
      id: '2',
      fullName: 'Jane Doe',
      businessName: 'Jane Tailoring',
      phone: '08098765432',
      whatsapp: '08098765432',
      category: 'Tailor',
      bio: 'Custom tailoring and fashion design.',
      address: '5, Fashion Avenue, Ibadan',
      state: 'Oyo',
      city: 'Ibadan',
      status: 'approved',
      isAvailable: true,
      email: 'jane@example.com',
      profileImageUrl: null,
      galleryImageUrls: null,
      isFeatured: true,
      createdAt: null,
      tradetype: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Directory')),
      body: ListView.builder(
        itemCount: artisans.length,
        itemBuilder: (context, index) {
          final artisan = artisans[index];
          return ArtistCard(
            artisan: artisan,
            onTap: () {
              // Navigate to detail/profile page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Scaffold(
                    appBar: AppBar(title: Text('Artisan Detail')),
                    body: Center(child: Text('Details for ${artisan.fullName}')),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
