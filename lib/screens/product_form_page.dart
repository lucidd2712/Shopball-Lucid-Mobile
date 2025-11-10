import 'package:flutter/material.dart';
import 'package:shopball_lucid/widgets/left_drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  int _price = 0;
  String _description = '';
  String _category = 'Jersey';
  String _thumbnail = '';
  bool _isFeatured = false;

  final List<String> _categories = [
    'Jersey',
    'Sepatu',
    'Bola',
    'Aksesoris',
    'Peralatan Latihan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Produk Baru',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama Produk
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nama Produk',
                  hintText: 'Contoh: Jersey Home 24/25',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: (value) => setState(() => _name = value.trim()),
                validator: (value) {
                  final v = value?.trim() ?? '';
                  if (v.isEmpty) return 'Nama produk tidak boleh kosong.';
                  if (v.length < 3) return 'Nama produk minimal 3 karakter.';
                  if (v.length > 50) return 'Nama produk maksimal 50 karakter.';
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Harga
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Harga (Rp)',
                  hintText: 'Contoh: 250000',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _price = int.tryParse(value) ?? 0;
                  });
                },
                validator: (value) {
                  final v = value?.trim() ?? '';
                  if (v.isEmpty) return 'Harga tidak boleh kosong.';
                  final parsed = int.tryParse(v);
                  if (parsed == null) return 'Harga harus berupa angka.';
                  if (parsed <= 0) return 'Harga harus lebih dari 0.';
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Deskripsi
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Deskripsi',
                  hintText: 'Tuliskan deskripsi produk.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                maxLines: 4,
                onChanged: (value) =>
                    setState(() => _description = value.trim()),
                validator: (value) {
                  final v = value?.trim() ?? '';
                  if (v.isEmpty) return 'Deskripsi tidak boleh kosong.';
                  if (v.length < 10) return 'Deskripsi minimal 10 karakter.';
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Kategori
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Kategori',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                value: _category,
                items: _categories
                    .map(
                      (cat) => DropdownMenuItem(
                        value: cat,
                        child: Text(cat),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _category = value ?? _category;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kategori tidak boleh kosong.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // URL Thumbnail
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'URL Thumbnail',
                  hintText: 'https://contoh.com/gambar-produk.jpg',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: (value) =>
                    setState(() => _thumbnail = value.trim()),
                validator: (value) {
                  final v = value?.trim() ?? '';
                  if (v.isEmpty) return 'URL thumbnail tidak boleh kosong.';

                  final uri = Uri.tryParse(v);
                  if (uri == null ||
                      (uri.scheme != 'http' && uri.scheme != 'https')) {
                    return 'URL thumbnail tidak valid.';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Produk Unggulan
              SwitchListTile(
                title: const Text('Jadikan produk unggulan'),
                value: _isFeatured,
                onChanged: (value) {
                  setState(() {
                    _isFeatured = value;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Tombol Save
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Produk berhasil tersimpan'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nama: $_name'),
                                  Text('Harga: Rp$_price'),
                                  Text('Deskripsi: $_description'),
                                  Text('Kategori: $_category'),
                                  Text('Thumbnail: $_thumbnail'),
                                  Text(
                                    'Unggulan: ${_isFeatured ? "Ya" : "Tidak"}',
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  _formKey.currentState!.reset();
                                  setState(() {
                                    _name = '';
                                    _price = 0;
                                    _description = '';
                                    _category = _categories.first;
                                    _thumbnail = '';
                                    _isFeatured = false;
                                  });
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
