import '../features/models/artisan.dart';
import '../features/utils/supabase.dart';

class ArtisanService {
  final String _table = 'artisans';

  Future<List<Artisan>> fetchArtisans() async {
    final response = await SupabaseUtils.client.from(_table).select();
    if (response == null) return [];
    return (response as List)
        .map((json) => Artisan.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<Artisan?> fetchArtisanById(String id) async {
    final response = await SupabaseUtils.client.from(_table).select().eq('id', id).single();
    if (response == null) return null;
    return Artisan.fromJson(response as Map<String, dynamic>);
  }

  Future<bool> addArtisan(Artisan artisan) async {
    final response = await SupabaseUtils.client.from(_table).insert(artisan.toJson());
    return response != null;
  }

  Future<bool> updateArtisan(String id, Map<String, dynamic> data) async {
    final response = await SupabaseUtils.client.from(_table).update(data).eq('id', id);
    return response != null;
  }

  Future<bool> deleteArtisan(String id) async {
    final response = await SupabaseUtils.client.from(_table).delete().eq('id', id);
    return response != null;
  }
}
