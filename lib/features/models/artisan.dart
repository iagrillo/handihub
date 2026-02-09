class Artisan {
  final String? id;
  final String fullName;
  final String? businessName;
  final String phone;
  final String? whatsapp;
  final String category;
  final String? bio;
  final String? address;
  final String? state;
  final String? city;
  final String? status;
  final bool? isAvailable;
  final String? email;
  final String? profileImageUrl;
  final List<String>? galleryImageUrls;
  final bool? isFeatured;
  final String? createdAt;
  final String? tradetype;

  Artisan({
    this.id,
    required this.fullName,
    this.businessName,
    required this.phone,
    this.whatsapp,
    required this.category,
    this.bio,
    this.address,
    this.state,
    this.city,
    this.status,
    this.isAvailable,
    this.email,
    this.profileImageUrl,
    this.galleryImageUrls,
    this.isFeatured,
    this.createdAt,
    this.tradetype,
  });

  factory Artisan.fromJson(Map<String, dynamic> json) => Artisan(
    id: json['id'] as String?,
    fullName: json['full_name'] as String,
    businessName: json['business_name'] as String?,
    phone: json['phone'] as String,
    whatsapp: json['whatsapp'] as String?,
    category: json['category'] as String,
    bio: json['bio'] as String?,
    address: json['address'] as String?,
    state: json['state'] as String?,
    city: json['city'] as String?,
    status: json['status'] as String?,
    isAvailable: json['is_available'] as bool?,
    email: json['email'] as String?,
    profileImageUrl: json['profile_image_url'] as String?,
    galleryImageUrls: (json['gallery_image_urls'] as List?)?.map((e) => e as String).toList(),
    isFeatured: json['is_featured'] as bool?,
    createdAt: json['created_at'] as String?,
    tradetype: json['tradetype'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'full_name': fullName,
    'business_name': businessName,
    'phone': phone,
    'whatsapp': whatsapp,
    'category': category,
    'bio': bio,
    'address': address,
    'state': state,
    'city': city,
    'status': status,
    'is_available': isAvailable,
    'email': email,
    'profile_image_url': profileImageUrl,
    'gallery_image_urls': galleryImageUrls,
    'is_featured': isFeatured,
    'created_at': createdAt,
    'tradetype': tradetype,
  };
}
