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




# TUGAS 8


(Nomor 1) Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Navigator push
Navigator push menambahkan halaman baru di atas halaman saat ini pada stack navigasi. Halaman lama tetap ada sehingga pengguna dapat kembali menggunakan tombol back.
Pada aplikasi Football Shop: dipakai saat menekan tombol Tambah Produk di halaman utama. Pengguna masuk ke halaman form, dan masih bisa kembali ke halaman utama dengan back tanpa memuat ulang dari awal.
Navigator pushReplacement
Navigator pushReplacement mengganti halaman saat ini dengan halaman baru. Halaman lama dihapus dari stack sehingga tombol back tidak akan kembali ke halaman sebelumnya.
Pada aplikasi Football Shop: dipakai pada navigasi melalui Drawer. Contoh, ketika memilih Tambah Produk atau Halaman Utama dari Drawer, halaman yang sedang dibuka diganti dengan halaman tujuan. Ini membuat navigasi lebih rapi dan mencegah penumpukan banyak halaman yang sama saat pengguna berkali kali memilih menu drawer.



(Nomor 2)Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Scaffold digunakan sebagai kerangka utama setiap halaman. Di dalamnya terdapat AppBar, body, dan Drawer sehingga semua halaman memiliki struktur yang seragam.
AppBar dipakai untuk menampilkan judul aplikasi Football Shop di bagian atas dengan gaya yang konsisten, sehingga pengguna selalu tahu sedang berada di aplikasi yang sama.
Drawer ditempatkan di properti drawer milik Scaffold pada halaman utama dan halaman form. Isi Drawer sama, yaitu menu Halaman Utama dan Tambah Produk. Dengan cara ini, dari halaman mana pun pengguna selalu memiliki akses navigasi yang konsisten tanpa harus membuat ulang logika navigasi di setiap halaman.



(Nomor 3)Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Padding
Memberi jarak di sekeliling elemen input sehingga tampilan form lebih rapi, mudah dibaca, dan tidak menempel pada tepi layar. Misalnya setiap TextFormField pada form tambah produk dibungkus Padding agar jarak antar field seragam.

SingleChildScrollView
Memungkinkan seluruh isi form digulir ketika tingginya melebihi layar, terutama pada perangkat dengan layar kecil. Pada halaman tambah produk, Form dibungkus SingleChildScrollView sehingga semua field tetap dapat diakses tanpa terpotong.

ListView atau Column dalam SingleChildScrollView
Memudahkan penataan elemen form secara vertikal dan terstruktur. Dalam aplikasi ini digunakan Column di dalam SingleChildScrollView untuk menyusun field nama produk, harga, deskripsi, kategori, url thumbnail, switch produk unggulan, dan tombol simpan secara berurutan.
Kombinasi Padding dan tampilan yang dapat digulir membuat form lebih nyaman digunakan dan mengurangi risiko input terlewat.



(Nomor 4)Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Penyesuaian warna tema dilakukan pada MaterialApp dengan mendefinisikan skema warna utama yang mencerminkan brand Football Shop, misalnya menggunakan warna biru sebagai warna identitas. Warna tersebut diterapkan sebagai colorScheme primary sehingga:
AppBar pada semua halaman memiliki warna biru yang sama.
Drawer header dan elemen penting lain juga menggunakan warna yang konsisten.
Tombol utama seperti tombol simpan pada form menggunakan warna yang selaras.
Dengan cara ini, seluruh halaman terasa satu kesatuan, mudah dikenali sebagai Football Shop, dan tidak membingungkan pengguna karena perubahan warna yang tidak konsisten.
