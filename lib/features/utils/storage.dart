import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/artisan.dart';

class StorageUtils {
	static const String _artisanKey = 'handihub_artisans';

	/// Get all artisans from local storage
	static Future<List<Artisan>> getArtisans() async {
		final prefs = await SharedPreferences.getInstance();
		final data = prefs.getString(_artisanKey);
		if (data == null) return [];
		final List<dynamic> jsonList = jsonDecode(data);
		return jsonList.map((e) => Artisan.fromJson(e)).toList();
	}

	/// Add a new artisan to local storage
	static Future<void> addArtisan(Artisan artisan) async {
		final prefs = await SharedPreferences.getInstance();
		final artisans = await getArtisans();
		artisans.add(artisan);
		final jsonList = artisans.map((a) => a.toJson()).toList();
		await prefs.setString(_artisanKey, jsonEncode(jsonList));
	}

	/// Clear all artisans (for testing/demo)
	static Future<void> clearArtisans() async {
		final prefs = await SharedPreferences.getInstance();
		await prefs.remove(_artisanKey);
	}
}
