NOTE: Maaf kak sebenernya tugas 7 saya ga ngumpul telat, minggu lalu udah selesai tapi salah push malah ke github repo football-news-mobile, push yang sekarang memperbaiki commitnya aja #peace #pls jgn dikurangin huhu

Tugas 8

Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Navigator.push() --> Menambahkan halaman baru di atas stack navigasi tanpa menghapus halaman sebelumnya. Di aplikasi Football Shop, fungsi ini cocok untuk navigasi yang tidak menggantikan halaman utama, misalnya saat pengguna menekan tombol “Detail Produk” dari halaman katalog. Jadi, ketika pengguna klik tombol back, ia bisa balik.

Navigator.pushReplacement() --> Mengganti halaman saat ini dengan halaman baru sehingga halaman sebelumnya dihapus dari stack. Di aplikasi Football Shop, fungsi ini cocok untuk navigasi setelah proses login atau checkout sukses, di mana pengguna tidak perlu kembali ke halaman sebelumnya. Jadi, pengguna tidak bisa kembali ke halaman sebelumnya dengan tombol back.

Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Scaffold --> Memberikan struktur dasar halaman seperti body, AppBar, Drawer, dan FloatingActionButton. Di Football Shop, ini membantu menjaga tampilan halaman tetap seragam.

AppBar --> Berfungsi sebagai header halaman, menampilkan judul, ikon pencarian, atau keranjang belanja.

Drawer --> Menyediakan navigasi global antarhalaman seperti Home, Kategori, dan Profil. Dengan ini, pengguna bisa berpindah antarhalaman dengan mudah tanpa mengubah struktur utama.

Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Padding --> Menambah jarak antar elemen agar tampilan lebih rapi dan mudah dibaca.

SingleChildScrollView --> Membuat halaman bisa di-scroll ketika konten lebih panjang dari layar, terutama untuk form checkout atau registrasi.

ListView --> Digunakan untuk menampilkan daftar item seperti list produk, keranjang belanja, atau riwayat pesanan.

Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Saya memanfaatkan ThemeData di MaterialApp untuk menentukan warna utama, sekunder, dan gaya teks agar mencerminkan identitas brand Football Shop saya. Dengan begitu, seluruh komponen (AppBar, tombol, ikon, teks) mengikuti identitas visual yang konsisten dengan citra Football Shop saya.


Tugas 7
1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree dalam Flutter adalah struktur hierarki yang menggambarkan bagaimana seluruh widget tersusun di dalam aplikasi. Setiap elemen tampilan, seperti teks, gambar, tombol, dan layout, merupakan widget yang saling terhubung melalui hubungan parent-child (induk-anak). Widget induk bertanggung jawab mengatur tata letak dan perilaku widget anak, seperti posisi, ukuran, dan urutan tampilannya. Misalnya, sebuah Column dapat menjadi parent yang berisi beberapa child seperti Text dan ElevatedButton, yang disusun secara vertikal. Dengan cara ini, Flutter membangun antarmuka pengguna melalui kombinasi widget yang saling bersarang.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
Dalam proyek ini, terdapat beberapa widget yang digunakan dengan fungsinya masing-masing. Widget MaterialApp berperan sebagai kerangka utama aplikasi berbasis Material Design, sedangkan Scaffold menyediakan struktur halaman seperti AppBar dan body. Widget AppBar digunakan untuk menampilkan bagian atas halaman dengan judul aplikasi. Kemudian, Column dan Row digunakan untuk menyusun elemen secara vertikal dan horizontal. Container berfungsi sebagai pembungkus fleksibel yang dapat diatur ukuran, warna, dan jaraknya. Widget lain seperti Text digunakan untuk menampilkan teks, Image untuk menampilkan gambar, ElevatedButton untuk membuat tombol interaktif, dan Icon untuk menampilkan ikon. Semua widget tersebut bekerja sama membentuk tampilan antarmuka yang terstruktur dan interaktif.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
Widget MaterialApp memiliki fungsi utama sebagai pembungkus seluruh aplikasi yang menggunakan gaya Material Design. Widget ini mengatur elemen penting seperti judul aplikasi, tema (warna, font, dan gaya), serta navigasi antar halaman. MaterialApp sering digunakan sebagai widget root karena menyediakan konteks global yang memungkinkan widget lain seperti Scaffold, AppBar, dan FloatingActionButton berfungsi dengan benar. Dengan menjadikannya widget root, aplikasi Flutter dapat menggunakan sistem desain Material secara konsisten di seluruh halaman.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
Perbedaan utama antara StatelessWidget dan StatefulWidget terletak pada kemampuan mereka dalam menampung dan mengelola data yang berubah. StatelessWidget bersifat statis, artinya tampilannya tidak berubah selama aplikasi berjalan; cocok digunakan untuk elemen yang tidak membutuhkan pembaruan, seperti teks atau ikon. Sebaliknya, StatefulWidget memiliki state yang dapat berubah dan dapat memperbarui tampilannya menggunakan metode setState(). Widget jenis ini digunakan ketika ada interaksi pengguna atau data yang dinamis, seperti tombol counter, input form, atau tampilan yang bergantung pada data API. Dengan demikian, pemilihan di antara keduanya tergantung pada kebutuhan perubahan data dalam tampilan aplikasi.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah objek yang merepresentasikan posisi suatu widget di dalam widget tree. Objek ini penting karena memungkinkan widget untuk berinteraksi dengan widget lain di atasnya (ancestor), misalnya untuk mengambil tema menggunakan Theme.of(context) atau melakukan navigasi melalui Navigator.of(context). Dalam metode build(), BuildContext digunakan untuk menentukan bagaimana tampilan widget dibangun berdasarkan lingkungan atau posisi widget tersebut dalam hierarki aplikasi. Dengan kata lain, BuildContext menjadi penghubung antara widget dengan struktur keseluruhan aplikasi Flutter.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Konsep Hot Reload dalam Flutter memungkinkan pengembang untuk melihat perubahan kode secara langsung tanpa harus menghentikan aplikasi, dan tanpa kehilangan state atau data yang sedang berjalan. Fitur ini sangat berguna ketika melakukan penyesuaian pada tampilan UI atau logika kecil secara cepat. Sementara itu, Hot Restart akan memulai ulang seluruh aplikasi dari awal dan menghapus semua state yang tersimpan, seolah-olah aplikasi baru dijalankan kembali. Perbedaan utamanya adalah Hot Reload mempertahankan kondisi aplikasi, sedangkan Hot Restart mengembalikan aplikasi ke keadaan awal.