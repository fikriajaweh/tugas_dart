# SPEC.md - Spesifikasi Aplikasi Katalog Menu Kantin Sekolah

## 1. Overview & Goal
Aplikasi Katalog Menu Kantin Sekolah adalah aplikasi Flutter berbasis mobile yang dirancang untuk memudahkan siswa dalam menjelajahi daftar makanan/minuman kantin, mencari jajanan berdasarkan nama, melihat detail informasi produk, serta mengelola pesanan keranjang secara interaktif.

---

## 2. Tech Stack & System Constraints

### Tech Stack
- Framework: Flutter (Dart SDK)
- State Management: StatefulWidget (Local State Management)
- Styling & Fonts: Package google_fonts
- Asset Management: Image.asset (Asset lokal disimpan di folder assets/images/ dan didaftarkan di pubspec.yaml)
- Navigation: Navigator (Navigator.push & Navigator.pop)

### Batasan Sistem (System Constraints)
- Platform Target: Android (Export ke format APK via flutter build apk)
- Responsive Layout: Bebas dari UI Overflow error (tidak ada garis kuning-hitam di layar).
- Struktur Proyek (Refactoring): Kode dipisah secara rapi ke dalam file terpisah di folder lib/:
  - lib/models/menu_item.dart
  - lib/pages/home_page.dart
  - lib/pages/detail_page.dart
  - lib/pages/cart_page.dart
  - lib/pages/about_page.dart
- Clean Code Standard: Penghapusan widget pembungkus yang tidak terpakai, spasi fungsi teratur, dan pemisahan logika/view yang rapi.

---

## 3. User Stories & Acceptance Criteria

### US-01: JELAJAH DAN PENCARIAN MENU (Halaman Utama)
As a Siswa Sekolah
I want to melihat daftar menu makanan/minuman dan mencari jajanan berdasarkan nama lewat kolom pencarian
So that saya dapat menemukan menu favorit saya dengan cepat tanpa harus scroll seluruh daftar.

#### Business Rules:
- Terdapat minimal 5 jenis makanan/minuman (contoh: Mi Ayam, Batagor, Es Teh Manis, Bakso, Nasi Goreng).
- Pencarian dilakukan secara real-time saat pengguna mengetik huruf di TextField.
- Teks pada judul aplikasi dan nama makanan wajib menggunakan gaya huruf dari paket google_fonts.

#### Acceptance Criteria (AC):
- AC-1.1: Halaman Utama menampilkan TextField pencarian di bagian atas layar.
- AC-1.2: Pengguna dapat mengetik di TextField dan daftar menu di bawahnya langsung tersaring berdasarkan kata kunci nama menu (case-insensitive).
- AC-1.3: Daftar menu ditampilkan menggunakan gabungan ListView.builder dan Expanded.
- AC-1.4: Setiap item menu menampilkan gambar lokal (Image.asset), nama menu, dan harga item.
- AC-1.5: Mengklik salah satu item menu memicu Navigator.push menuju Halaman Detail Menu.

---

### US-02: DETAIL MENU DAN PERHITUNGAN PORSI (Halaman Detail)
As a Siswa Sekolah
I want to melihat detail informasi menu dan menyesuaikan jumlah porsi yang ingin dibeli
So that saya mengetahui total harga pesanan secara otomatis sebelum menambahkannya ke keranjang.

#### Business Rules:
- Halaman detail menampilkan foto menu berukuran besar (Image.asset), nama menu, harga satuan, dan deskripsi singkat.
- Jumlah porsi minimal adalah 1 porsi.
- Total harga dihitung secara otomatis: Total Harga = Harga Satuan x Jumlah Porsi.

#### Acceptance Criteria (AC):
- AC-2.1: Menampilkan foto menu, nama, deskripsi, dan harga satuan dengan font dari google_fonts.
- AC-2.2: Terdapat tombol penambah (+) dan pengurang (-) jumlah porsi.
- AC-2.3: Variabel State memperbarui jumlah porsi dan total harga secara otomatis saat tombol + atau - ditekan.
- AC-2.4: Terdapat tombol "Masukkan ke Keranjang" yang menyimpan data ke Halaman Keranjang Belanja.

---

### US-03: KERANJANG BELANJA (Halaman Ekstra 1)
As a Siswa Sekolah
I want to melihat daftar item pesanan yang telah dimasukkan ke keranjang
So that saya dapat memeriksa kembali total biaya sebelum melakukan pemesanan di kantin.

#### Business Rules:
- Menampilkan rincian item, jumlah porsi, serta kalkulasi akumulasi total bayar.

#### Acceptance Criteria (AC):
- AC-3.1: Halaman Keranjang dapat diakses dari tombol navigasi keranjang.
- AC-3.2: Menampilkan daftar item yang telah ditambahkan beserta porsi dan subtotal harganya.
- AC-3.3: Menampilkan ringkasan Total Pembayaran.

---

### US-04: INFORMASI TENTANG KANTIN (Halaman Ekstra 2)
As a Siswa Sekolah / Pengunjung
I want to melihat informasi profil kantin sekolah
So that saya mengetahui jam operasional, lokasi kantin, dan kontak pengurus kantin.

#### Business Rules:
- Halaman berisi informasi statis mengenai profil kantin sekolah.

#### Acceptance Criteria (AC):
- AC-4.1: Menampilkan nama kantin, lokasi/gedung, jam buka/tutup, dan kontak pengurus kantin.
- AC-4.2: Menggunakan styling google_fonts agar selaras dengan tema aplikasi.

---

## 4. Struktur Direktori Proyek

lib/
├── main.dart
├── models/
│   └── menu_item.dart
└── pages/
    ├── home_page.dart
    ├── detail_page.dart
    ├── cart_page.dart
    └── about_page.dart
assets/
└── images/
    ├── mi_ayam.png
    ├── batagor.png
    ├── es_teh.png
    ├── bakso.png
    └── nasi_goreng.png

---

## 5. Kriteria Pengumpulan (Delivery Checklists)
- Source Code: Repositori GitHub terorganisir dengan rapi dan bebas dari unnecessary wrapper widgets.
- APK Build: Bebas dari UI Overflow, dapat di-generate melalui perintah `flutter build apk` dan dapat diinstal di Android.
- Dokumentasi: File SPEC.md disertakan di dalam root folder proyek.