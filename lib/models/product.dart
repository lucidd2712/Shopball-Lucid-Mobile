// lib/models/product.dart

class Product {
  final int id;              // dari "pk"
  final int? user;           // bisa null
  final String name;
  final double price;        // "1500000.00" -> 1500000.0
  final int stock;
  final String description;
  final String imageUrl;     // dari "image_url"
  final String category;
  final DateTime createdAt;
  final bool isFeatured;     // tidak ada di JSON sekarang -> default false

  Product({
    required this.id,
    required this.user,
    required this.name,
    required this.price,
    required this.stock,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.createdAt,
    required this.isFeatured,
  });

  /// d di sini adalah satu elemen list dari JSON kamu
  /// contoh: { "model": "main.product", "pk": 1, "fields": { ... } }
  factory Product.fromJson(Map<String, dynamic> json) {
    final fields = json['fields'] as Map<String, dynamic>;

    return Product(
      id: json['pk'] as int,
      user: fields['user'] as int?, // bisa null
      name: fields['name'] as String,
      price: double.tryParse(fields['price'].toString()) ?? 0,
      stock: fields['stock'] as int? ?? 0,
      description: fields['description'] as String? ?? '',
      imageUrl: fields['image_url'] as String? ?? '',
      category: fields['category'] as String? ?? '',
      createdAt: DateTime.parse(fields['created_at'] as String),
      // kalau nanti di Django kamu tambahkan field is_featured (BooleanField),
      // ini langsung ikut kebaca; kalau belum ada, default false
      isFeatured: fields['is_featured'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "pk": id,
      "fields": {
        "user": user,
        "name": name,
        "price": price.toStringAsFixed(2),
        "stock": stock,
        "description": description,
        "image_url": imageUrl,
        "category": category,
        "created_at": createdAt.toIso8601String(),
        "is_featured": isFeatured,
      },
    };
  }
}
