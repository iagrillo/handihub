import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class UploadUtils {
	/// Upload a file to Supabase Storage and return the public URL
	static Future<String> uploadFile({
		required File file,
		required String bucket,
		required String folder,
	}) async {
		final client = Supabase.instance.client;
		final ext = file.path.split('.').last;
		final fileName = '${DateTime.now().millisecondsSinceEpoch}.${ext}';
		final path = '$folder/$fileName';

		final response = await client.storage.from(bucket).upload(path, file);
		if (response.error != null) {
			throw Exception('Upload failed: ${response.error!.message}');
		}
		final publicUrl = client.storage.from(bucket).getPublicUrl(path).data;
		if (publicUrl == null) {
			throw Exception('Failed to get public URL');
		}
		return publicUrl;
	}
}
