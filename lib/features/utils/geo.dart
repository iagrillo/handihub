import 'dart:math';

class GeoUtils {
	/// Calculate the distance between two lat/lon points in kilometers (Haversine formula)
	static double haversineDistance(double lat1, double lon1, double lat2, double lon2) {
		const R = 6371; // Earth radius in km
		final dLat = _deg2rad(lat2 - lat1);
		final dLon = _deg2rad(lon2 - lon1);
		final a =
				sin(dLat / 2) * sin(dLat / 2) +
				cos(_deg2rad(lat1)) * cos(_deg2rad(lat2)) *
				sin(dLon / 2) * sin(dLon / 2);
		final c = 2 * atan2(sqrt(a), sqrt(1 - a));
		return R * c;
	}

	static double _deg2rad(double deg) => deg * (pi / 180);

	/// Validate if coordinates are within valid ranges
	static bool isValidCoordinate(double lat, double lon) {
		return lat >= -90 && lat <= 90 && lon >= -180 && lon <= 180;
	}
}
