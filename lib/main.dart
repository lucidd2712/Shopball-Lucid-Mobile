import 'package:flutter/material.dart';
// Ganti 'shopball_lucid' dengan nama package di pubspec.yaml kamu jika berbeda.
import 'package:shopball_lucid/menu.dart';

void main() {
  runApp(const FootballShopApp());
}

class FootballShopApp extends StatelessWidget {
  const FootballShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Warna dasar aplikasi (mengikuti arahan tutorial).
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.blueAccent[400]),
        useMaterial3: false,
      ),
      home: MyHomePage(), // pastikan tanpa 'const' sesuai instruksi tutorial
    );
  }
}
