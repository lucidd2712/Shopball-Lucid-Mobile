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








# TUGAS 9
(Nomor 1) Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
Kita membuat model Dart ketika mengambil atau mengirim data JSON supaya data yang datang dari backend punya bentuk yang jelas dan aman. Dengan model, setiap field punya tipe yang tegas, misalnya name sebagai String, price sebagai int, createdAt sebagai DateTime. Ketika kita membuat factory fromJson dan toJson, proses konversi dari JSON ke objek dan sebaliknya selalu melewati satu pintu yang terkontrol. Ini membantu null safety, karena kita bisa menentukan field mana yang wajib ada dan mana yang boleh null, sehingga banyak error bisa tertangkap saat kompilasi, bukan ketika aplikasi sudah berjalan di tangan pengguna.

Kalau kita hanya memakai Map<String, dynamic> tanpa model, seluruh struktur data jadi longgar. Kita akan sering menulis map["name"] atau map["price"] di banyak tempat, sehingga rawan salah ketik kunci, salah cast tipe, dan sulit dilacak ketika API berubah. Null safety menjadi lemah karena semua nilai bertipe dynamic sehingga pengecekan baru terasa ketika aplikasi mengalami crash. Dari sisi maintainability, model membuat kode lebih rapi, mudah dibaca, mudah di refactor, dan didukung autocompletion oleh IDE. Tanpa model, logika bisnis bercampur dengan akses map, dan setiap perubahan format JSON mengharuskan kita memeriksa banyak file secara manual.



(Nomor 2) Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
Package http berfungsi sebagai klien HTTP umum untuk mengirim permintaan ke server. Dengan http kita bisa melakukan operasi dasar seperti GET dan POST ke suatu URL, mengirim body dan header, dan menerima response mentah berupa status code serta body. Jadi http cocok untuk komunikasi yang tidak bergantung pada sesi pengguna atau ketika kita mengelola header dan cookie secara manual.

CookieRequest pada tugas ini adalah lapisan di atas http yang sudah di sesuaikan dengan kebutuhan Django yang memakai sesi dan cookie. CookieRequest menyimpan cookie sesi dari Django, mengatur header yang diperlukan, mengelola login, logout, dan mempermudah pemanggilan endpoint yang membutuhkan autentikasi. Ketika kita memanggil login melalui CookieRequest, ia bukan hanya mengirim username dan password, tetapi juga menyimpan cookie sesi yang dikembalikan Django, sehingga permintaan berikutnya otomatis dianggap berasal dari pengguna yang sudah login. Jadi http adalah alat umum, sedangkan CookieRequest adalah alat khusus yang sudah dikonfigurasi untuk berbicara dengan backend Django yang memakai sesi dan cookie.



(Nomor 3) Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Instance CookieRequest perlu dibagikan ke semua komponen aplikasi Flutter supaya seluruh bagian aplikasi memakai sesi yang sama. Setelah pengguna berhasil login, informasi autentikasi tersimpan di dalam cookie yang di kelola oleh CookieRequest. Jika setiap halaman membuat instance CookieRequest sendiri, maka cookie tidak akan terbagi, sehingga ada halaman yang menganggap pengguna belum login, sementara halaman lain sudah.

Dengan membungkus CookieRequest di dalam Provider pada main.dart, kita memastikan hanya ada satu instance yang hidup dan dapat di akses oleh seluruh widget melalui context.watch atau context.read. Pola ini membuat status login konsisten, memudahkan pemanggilan endpoint yang butuh autentikasi, dan menghindari bug aneh seperti bisa login di satu halaman tetapi gagal memanggil data di halaman lain karena sesi tidak tersimpan dengan benar.



(Nomor 4) Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
Supaya Flutter dapat berkomunikasi dengan Django, ada beberapa konfigurasi yang perlu di selaraskan. Penambahan alamat 10.0.2.2 ke ALLOWED_HOSTS diperlukan ketika kita menjalankan aplikasi di emulator Android. Dari sudut pandang emulator, localhost mengarah ke mesin virtualnya sendiri, sedangkan 10.0.2.2 adalah alamat khusus yang menunjuk ke localhost milik komputer pengembang. Jika alamat ini tidak di masukkan ke ALLOWED_HOSTS, Django menganggap permintaan tersebut mencurigakan dan mengembalikan respons Bad Request.

Untuk Flutter web, domain asal aplikasi berbeda dengan domain Django, sehingga termasuk kasus cross origin. Karena itu kita perlu mengaktifkan CORS dan mengizinkan kredensial supaya permintaan lintas origin di terima dan cookie sesi dapat di kirim. Selain itu, pengaturan cookie seperti SameSite None dan flag secure di perlukan agar browser bersedia mengirim cookie pada permintaan dari origin lain. Jika pengaturan ini salah, login mungkin tampak berhasil satu kali, tetapi cookie tidak pernah terkirim pada permintaan berikutnya sehingga Django menganggap pengguna belum login.

Di Android, izin akses internet pada manifest juga wajib di aktifkan. Tanpa izin ini, aplikasi tidak dapat membuat koneksi jaringan sama sekali. Akibatnya, semua pemanggilan ke Django akan gagal sebelum mencapai server, meskipun konfigurasi Django sudah benar. Intinya, jika konfigurasi host, CORS, cookie, atau izin internet tidak tepat, komunikasi Flutter dan Django bisa gagal dengan gejala seperti error CORS di konsol, status tidak terautentik terus menerus, atau respons jaringan yang kosong.




(Nomor 5) Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Alur pengiriman data dari input hingga tampil di Flutter dapat dijelaskan dari dua sisi, penyimpanan dan penarikan.

Pada saat menyimpan data, pengguna mengisi form di Flutter, misalnya form penambahan produk. Setiap field di ikat ke variabel di state dan di validasi melalui GlobalKey<FormState>. Ketika tombol simpan di tekan dan validasi lolos, Flutter menyusun objek JSON berisi nilai nilai yang di input, kemudian mengirimkannya ke endpoint Django menggunakan fungsi postJson milik CookieRequest. Di sisi Django, view menerima permintaan tersebut, membaca body, memparse JSON, lalu memeriksa kelengkapan dan kebenaran data. Jika valid, Django membuat instance model Product dan menyimpannya ke database, kemudian mengembalikan respons JSON yang berisi status keberhasilan. Flutter membaca respons ini dan menampilkan SnackBar atau navigasi sesuai hasil.

Pada saat menampilkan data, misalnya di halaman daftar produk, Flutter memanggil endpoint JSON Django menggunakan request.get. Django mengambil data dari database, mengubahnya menjadi list JSON, dan mengirimkannya kembali ke Flutter. Fungsi fetchProducts di Flutter menerima list ini, mengubah setiap elemen menjadi instance model Product melalui fromJson, lalu FutureBuilder menunggu Future tersebut dan ketika data sudah tersedia, ia membangun widget ListView dengan memanfaatkan list Product. Hasil akhirnya, data yang sebelumnya di input dan disimpan melalui Django tampil sebagai daftar produk di layar Flutter.




(Nomor 6) Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Mekanisme autentikasi dari login, register, hingga logout melibatkan pertukaran data akun dan pengelolaan sesi oleh Django. Pada proses register, pengguna mengisi username dan dua kali password di Flutter. Data ini di kirim ke endpoint register Django menggunakan postJson dari CookieRequest. Django kemudian memanfaatkan UserCreationForm untuk memvalidasi kecocokan password dan aturan lain, membuat akun baru, dan mengembalikan respons yang memberi tahu apakah pendaftaran berhasil atau tidak. Flutter menampilkan pesan sesuai respons dan mengarahkan pengguna kembali ke halaman login jika sukses.

Pada proses login, pengguna mengisi username dan password di halaman Flutter. Data ini di kirim ke endpoint login Django melalui fungsi login milik CookieRequest. Django memanggil fungsi authenticate, memeriksa apakah kombinasi username dan password cocok dengan data di database, dan apabila benar, memanggil login yang membuat sesi dan menyimpan informasi pengguna di server. Django juga mengirim cookie sesi ke klien. CookieRequest menyimpan cookie ini dan menandai bahwa pengguna sudah login. Di Flutter, setelah request.loggedIn bernilai benar, aplikasi menavigasi ke halaman menu utama. Mulai saat itu, setiap pemanggilan endpoint yang memerlukan autentikasi dilakukan melalui instance CookieRequest yang sama sehingga Django bisa mengenali pengguna.

Saat logout, Flutter memanggil endpoint logout dengan request.logout. Django menghapus sesi di server dan menginstruksikan klien untuk menghapus cookie yang terkait. CookieRequest memperbarui status sehingga loggedIn menjadi salah. Flutter lalu mengarahkan pengguna kembali ke halaman login dan menampilkan pesan perpisahan. Dengan alur ini, autentikasi di kelola penuh oleh Django, sementara Flutter bertugas sebagai antarmuka yang mengirim data akun dan merespons status yang di kirim kembali oleh server.




(Nomor 7) Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
Langkah implementasi checklist saya lakukan secara berurutan dan tidak sekadar menyalin tutorial. Pertama, saya menyusun backend Django dengan membuat project dan app, mendefinisikan model Product yang mewakili produk sepak bola, lalu menyiapkan view untuk menampilkan data, baik dalam bentuk halaman HTML maupun dalam bentuk JSON melalui endpoint yang bisa di akses Flutter. Setelah itu saya membuat view tambahan khusus untuk kebutuhan Flutter, yaitu create_product_flutter yang menerima JSON, memvalidasi isian penting, dan menyimpan data ke database.
Kedua, saya mengatur konfigurasi konektivitas dan autentikasi di Django. Saya menambahkan alamat yang di perlukan ke ALLOWED_HOSTS, memasang dan mengaktifkan corsheaders, serta menyetel pengaturan cookie seperti CORS_ALLOW_CREDENTIALS, SameSite, dan flag secure supaya Flutter web maupun emulator Android dapat mengirim permintaan dan menerima cookie sesi dengan benar. Di sisi autentikasi, saya menambahkan view untuk register, login, dan logout baik yang memproduksi HTML untuk web, maupun yang memproduksi JSON untuk klien yang berkomunikasi lewat AJAX dan CookieRequest.
Ketiga, saya menyiapkan proyek Flutter. Saya menambahkan dependency provider dan pbp_django_auth pada berkas pubspec, lalu membuat model Dart Product yang memetakan struktur JSON dari Django menjadi objek terketik dengan factory fromJson. Di main.dart saya membungkus MaterialApp dengan Provider yang berisi satu instance CookieRequest sehingga dapat di gunakan di seluruh widget. Setelah itu, saya membangun halaman LoginPage dan RegisterPage yang memanggil endpoint autentikasi, halaman MyHomePage sebagai menu utama, halaman ProductListPage yang mengambil data dari endpoint JSON Django dan mengubahnya menjadi daftar Product, halaman ProductFormPage untuk mengirim data produk baru ke create_product_flutter, dan halaman ProductDetailPage untuk menampilkan detail setiap produk.
Keempat, saya menghubungkan semua bagian ini dan melakukan penyesuaian. Saya menyesuaikan URL backend antara localhost dan 10.0.2.2 sesuai target platform, memastikan navigasi antar halaman berjalan baik, menambahkan SnackBar dan dialog untuk menampilkan pesan keberhasilan atau kegagalan, serta memeriksa log Django untuk memastikan permintaan dari Flutter benar benar sampai dan mendapat respons yang sesuai. Dengan cara ini checklist terpenuhi melalui serangkaian langkah yang terencana, mulai dari desain model dan API di Django, konfigurasi konektivitas, hingga implementasi dan pengujian alur autentikasi serta pertukaran data di Flutter.
