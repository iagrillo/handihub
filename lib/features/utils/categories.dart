import '../models/category.dart';

// List of all artisan categories
final List<Category> categories = [
	Category(slug: 'bricklayer', name: 'Bricklayers / Masons', icon: 'Home'),
	Category(slug: 'carpenter', name: 'Carpenters', icon: 'Settings'),
	Category(slug: 'plumber', name: 'Plumbers', icon: 'Settings'),
	Category(slug: 'electrician', name: 'Electricians', icon: 'Shield'),
	Category(slug: 'tiler', name: 'Tilers', icon: 'Home'),
	Category(slug: 'welder', name: 'Welders & Fabricators', icon: 'Settings'),
	Category(slug: 'painter', name: 'Painters / Decorators', icon: 'Edit'),
	Category(slug: 'pop-installer', name: 'POP Installers', icon: 'Home'),
	Category(slug: 'aluminium', name: 'Aluminium / Windows', icon: 'Home'),
	Category(slug: 'roofer', name: 'Roofing Technicians', icon: 'Home'),
	Category(slug: 'scaffolder', name: 'Scaffolders', icon: 'Shield'),
	Category(slug: 'auto-mechanic', name: 'Auto Mechanics', icon: 'Settings'),
	Category(slug: 'okada-mechanic', name: 'Motorcycle Mechanics', icon: 'Settings'),
	Category(slug: 'vulcanizer', name: 'Vulcanizers', icon: 'Shield'),
	Category(slug: 'electronics-repair', name: 'Electronics Repair', icon: 'Settings'),
	Category(slug: 'ac-tech', name: 'AC & Refrigeration', icon: 'Shield'),
	Category(slug: 'cctv', name: 'CCTV & Security', icon: 'Shield'),
	Category(slug: 'generator-tech', name: 'Generator Technicians', icon: 'Settings'),
	Category(slug: 'solar-installer', name: 'Solar System Installers', icon: 'Star'),
	Category(slug: 'barber', name: 'Barbers', icon: 'User'),
	Category(slug: 'hair-stylist', name: 'Hair Stylists / Beauticians', icon: 'User'),
	Category(slug: 'makeup-artist', name: 'Makeup Artists', icon: 'Star'),
	Category(slug: 'tailor', name: 'Tailors / Seamstresses', icon: 'Edit'),
	Category(slug: 'fashion-designer', name: 'Fashion Designers', icon: 'Star'),
	Category(slug: 'weaver', name: 'Weavers', icon: 'Edit'),
	Category(slug: 'textile-dye', name: 'Textile Dye (Adire)', icon: 'Edit'),
	Category(slug: 'bag-maker', name: 'Bag Makers / Leather', icon: 'Edit'),
	Category(slug: 'shoe-maker', name: 'Shoe Makers / Cobblers', icon: 'Edit'),
	Category(slug: 'jeweller', name: 'Jewellers', icon: 'Star'),
	Category(slug: 'manicurist', name: 'Manicurists / Pedicurists', icon: 'Heart'),
	Category(slug: 'glass-glazing', name: 'Glass & Glazing', icon: 'Edit'),
	Category(slug: 'locksmith', name: 'Locksmiths', icon: 'Shield'),
	Category(slug: 'sculptor', name: 'Sculptors / Carvers', icon: 'Star'),
	Category(slug: 'potter', name: 'Potters / Ceramicists', icon: 'Edit'),
	Category(slug: 'chef', name: 'Chefs / Cooks', icon: 'Star'),
	Category(slug: 'domestic-service', name: 'Domestic Services', icon: 'User'),
	Category(slug: 'facility-tech', name: 'Facility Technicians', icon: 'Settings'),
];

// Utility: Find a category by slug
Category? getCategoryBySlug(String slug) {
	return categories.firstWhere((c) => c.slug == slug, orElse: () => Category(slug: slug, name: slug, icon: 'Help'));
}

// Utility: Filter categories by name
List<Category> filterCategories(String query) {
	return categories.where((c) => c.name.toLowerCase().contains(query.toLowerCase())).toList();
}
