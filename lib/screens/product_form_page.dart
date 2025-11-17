import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:shopball_lucid/widgets/left_drawer.dart';
import 'package:shopball_lucid/screens/menu.dart';

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
  String _thumbnail = '';
  String _category = '';
  bool _isFeatured = false;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk'),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Nama Produk",
                        ),
                        onChanged: (value) => _name = value,
                        validator: (value) => value == null || value.isEmpty
                            ? "Nama wajib diisi"
                            : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Harga",
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _price = int.tryParse(value) ?? 0;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Harga wajib diisi";
                          }
                          if (int.tryParse(value) == null) {
                            return "Harga harus berupa angka";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Deskripsi",
                        ),
                        maxLines: 3,
                        onChanged: (value) => _description = value,
                        validator: (value) => value == null || value.isEmpty
                            ? "Deskripsi wajib diisi"
                            : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "URL Thumbnail Gambar",
                        ),
                        onChanged: (value) => _thumbnail = value,
                        validator: (value) => value == null || value.isEmpty
                            ? "Thumbnail wajib diisi"
                            : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Kategori",
                        ),
                        onChanged: (value) => _category = value,
                        validator: (value) => value == null || value.isEmpty
                            ? "Kategori wajib diisi"
                            : null,
                      ),
                      const SizedBox(height: 12),
                      SwitchListTile(
                        title: const Text("Featured"),
                        value: _isFeatured,
                        onChanged: (value) {
                          setState(() {
                            _isFeatured = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) return;

                            final response = await request.postJson(
                              "http://localhost:8000/items/create-flutter/",
                              jsonEncode({
                                "name": _name,
                                "price": _price,
                                "description": _description,
                                // key DISESUAIKAN dgn Django: image_url
                                "image_url": _thumbnail,
                                "category": _category,
                                "is_featured": _isFeatured,
                              }),
                            );

                            if (context.mounted) {
                              if (response['status'] == 'success') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Produk berhasil disimpan!"),
                                  ),
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyHomePage(),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      response['message'] ??
                                          "Terjadi kesalahan saat menyimpan, coba lagi.",
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                          child: const Text("Simpan Produk"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
