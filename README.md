# PPM Sesi 2 - Dasar Flutter dan Widget

Aplikasi Flutter sederhana berisi halaman **Product & Profile**.

## Identitas

| Keterangan    | Data                  |
|---------------|-----------------------|
| Nama          | Ari Rizal Zalaludin   |
| NIM           | 20240040042           |
| Program Studi | Teknik Informatika    |
| Kelas         | TI24M                 |

## Fitur Aplikasi

1. **AppBar** berisi `PPM Sesi 2 - Ari Rizal Zalaludin (20240040042)`.
2. **Tema warna** Teal.
3. **Banner Promo** menggunakan `Stack` dan `Positioned`.
4. **Kartu Profil Mahasiswa** (`StatelessWidget`): nama, NIM, prodi/kelas, ikon profil, dan 5 ikon bintang.
5. **Kartu Produk** (`StatefulWidget`):
   - Placeholder gambar, nama produk, harga, dan kategori.
   - Tombol **Favorite**: ikon hati berubah dan jumlah Like bertambah/berkurang.
   - Tombol **-** dan **+** untuk jumlah produk (minimal 1).
   - Total harga berubah sesuai jumlah produk.
   - Tombol **Tambah ke Keranjang** menampilkan `SnackBar`.

## Widget yang Digunakan

`Scaffold`, `AppBar`, `Row`, `Column`, `Container`, `Card`, `Stack`, `Positioned`, `Icon`, `ElevatedButton`, `IconButton`, `SnackBar`, `StatelessWidget`, `StatefulWidget`.

## Cara Menjalankan

```bash
flutter pub get
flutter run
```

## Screenshot Hasil Aplikasi

> Simpan screenshot di folder `screenshots/` lalu ganti nama file di bawah ini.

| Tampilan Awal | Setelah Favorite & Jumlah | SnackBar |
|---------------|---------------------------|----------|
| ![Awal](screenshots/awal.png) | ![Favorite](screenshots/favorite.png) | ![SnackBar](screenshots/snackbar.png) |

## Struktur Project

```
ppm_2/
├── lib/
│   └── main.dart
├── screenshots/
├── pubspec.yaml
└── README.md
```
