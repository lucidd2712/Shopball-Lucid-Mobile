# TUGAS 7



(Nomor 1) Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree pada Flutter adalah struktur hierarki yang menggambarkan bagaimana seluruh elemen antarmuka atau UI tersusun di dalam aplikasi. Setiap komponen tampilan seperti teks, tombol, kolom, baris, hingga halaman merupakan sebuah widget yang saling bersarang membentuk pohon. Hubungan parent-child dalam Flutter berarti bahwa widget induk (parent) mengatur tata letak dan perilaku dari widget anak (child) yang ada di dalamnya. Jika parent dihapus, maka seluruh child yang berada di bawahnya juga ikut hilang dari tampilan. Prinsip ini sangat penting karena Flutter menggunakan pendekatan deklaratif, di mana UI dibangun ulang berdasarkan perubahan data yang terjadi melalui struktur widget tree tersebut.


(Nomor 2) Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
Dalam proyek Football Shop, berbagai widget digunakan untuk membentuk tampilan aplikasi. Widget MaterialApp berfungsi sebagai pembungkus utama aplikasi dengan tema dan navigasi berbasis Material Design. Scaffold digunakan untuk menyediakan struktur dasar halaman seperti AppBar, body, dan snackbar. AppBar berfungsi sebagai bagian atas halaman yang menampilkan judul aplikasi. Padding digunakan untuk memberi jarak agar tampilan lebih rapi, sedangkan Column menyusun elemen secara vertikal dan Row menyusun elemen secara horizontal. Card berfungsi menampilkan konten dalam bentuk kotak dengan bayangan yang membuat tampilan lebih terstruktur. Container digunakan untuk mengatur ukuran, warna, dan jarak di sekitar elemen. Text dan Icon berfungsi untuk menampilkan tulisan dan ikon. GridView.count digunakan untuk menampilkan beberapa tombol dalam bentuk grid dengan jumlah kolom tertentu. Material dan InkWell digunakan untuk menampilkan efek sentuhan dan mendeteksi interaksi pengguna, sedangkan SnackBar bersama ScaffoldMessenger digunakan untuk menampilkan pesan singkat di bagian bawah layar ketika tombol ditekan.


(Nomor 3)  Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
Widget MaterialApp memiliki fungsi sebagai fondasi utama aplikasi Flutter yang mengimplementasikan konsep Material Design dari Google. MaterialApp mengatur hal-hal global seperti tema warna, font, navigasi antarhalaman, serta menentukan widget yang pertama kali ditampilkan melalui properti home. Widget ini sering digunakan sebagai widget root karena ia memberikan konteks dasar bagi seluruh widget di bawahnya. Tanpa MaterialApp, banyak komponen seperti Scaffold, Theme, dan SnackBar tidak dapat berfungsi dengan baik karena tidak memiliki akses ke konteks Material Design yang disediakan oleh widget ini.


(Nomor 4)  Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
StatelessWidget dan StatefulWidget memiliki perbedaan mendasar pada kemampuan untuk menyimpan dan mengubah keadaan (state). StatelessWidget digunakan untuk tampilan yang tidak berubah sepanjang waktu, sehingga cocok untuk menampilkan elemen statis seperti teks, ikon, atau tata letak sederhana. Sedangkan StatefulWidget digunakan untuk tampilan yang dapat berubah akibat interaksi pengguna atau pembaruan data, karena ia memiliki objek State yang bisa diperbarui menggunakan metode setState(). Dalam proyek Football Shop digunakan StatelessWidget karena semua komponen seperti teks dan tombol bersifat statis dan tidak membutuhkan perubahan data secara dinamis. Jika suatu saat aplikasi membutuhkan fitur dinamis seperti daftar produk yang dapat berubah, maka StatefulWidget baru akan digunakan.


(Nomor 5)  Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah objek yang memberikan informasi tentang posisi suatu widget dalam struktur widget tree. Objek ini digunakan untuk mengakses data dan fungsi yang disediakan oleh widget induk, seperti tema aplikasi, navigator, atau ukuran layar. BuildContext menjadi sangat penting dalam metode build karena berperan sebagai penghubung antara widget dan lingkungan tempat ia berada. Misalnya, ketika menampilkan snackbar, diperlukan BuildContext agar Flutter tahu di Scaffold mana snackbar tersebut harus muncul.


(Nomor 6) Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Hot reload adalah fitur unggulan Flutter yang memungkinkan pengembang memperbarui tampilan aplikasi secara langsung tanpa menghentikan dan menjalankan ulang seluruh aplikasi. Flutter hanya mengganti bagian kode yang berubah di memori, lalu membangun ulang widget tree tanpa menghapus data atau keadaan yang sedang berjalan. Sebaliknya, hot restart akan memulai ulang aplikasi dari awal dan menghapus seluruh state yang tersimpan. Dengan kata lain, hot reload digunakan untuk mempercepat proses pengembangan terutama pada perubahan UI, sementara hot restart digunakan ketika perubahan kode memengaruhi struktur atau logika aplikasi secara menyeluruh.

