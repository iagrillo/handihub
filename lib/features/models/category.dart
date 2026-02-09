class Category {
  final String slug;
  final String name;
  final String icon;

  Category({required this.slug, required this.name, required this.icon});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    slug: json['slug'] as String,
    name: json['name'] as String,
    icon: json['icon'] as String,
  );

  Map<String, dynamic> toJson() => {
    'slug': slug,
    'name': name,
    'icon': icon,
  };
}
