// Utility functions for admin features

import '../models/artisan.dart';

class AdminUtils {
	/// Approve an artisan (example logic)
	static void approveArtisan(Artisan artisan) {
		// TODO: Implement backend call to approve artisan
		print('Artisan ${artisan.fullName} approved.');
	}

	/// Reject an artisan (example logic)
	static void rejectArtisan(Artisan artisan, {String? reason}) {
		// TODO: Implement backend call to reject artisan
		print('Artisan ${artisan.fullName} rejected. Reason: $reason');
	}

	/// Check if user is admin (example logic)
	static bool isAdmin(String email) {
		// Example: Only allow certain emails
		const adminEmails = ['admin@example.com'];
		return adminEmails.contains(email);
	}
}
