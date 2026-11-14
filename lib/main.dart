import 'package:flutter/material.dart';

// =============================================================
// PPM Sesi 2 - Dasar Flutter dan Widget
// Nama   : Ari Rizal Zalaludin
// NIM    : 20240040042
// Prodi  : Teknik Informatika
// Kelas  : TI24M
// =============================================================

void main() {
  runApp(const MyApp());
}

/// Helper untuk memformat angka menjadi format Rupiah, contoh: Rp 150.000
String formatRupiah(int value) {
  final text = value.toString();
  final buffer = StringBuffer();
  for (int i = 0; i < text.length; i++) {
    final sisa = text.length - i;
    buffer.write(text[i]);
    if (sisa > 1 && sisa % 3 == 1) {
      buffer.write('.');
    }
  }
  return 'Rp $buffer';
}

// -------------------------------------------------------------
// ROOT APP
// -------------------------------------------------------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PPM Sesi 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // Warna tema pilihan: Teal
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const HomePage(),
    );
  }
}

// -------------------------------------------------------------
// HALAMAN UTAMA (Product & Profile)
// -------------------------------------------------------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: const Text(
          'PPM Sesi 2 - Ari Rizal Zalaludin (20240040042)',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            PromoBanner(),
            SizedBox(height: 20),
            SectionTitle(title: 'Profil Mahasiswa', icon: Icons.school),
            SizedBox(height: 8),
            ProfileCard(),
            SizedBox(height: 20),
            SectionTitle(title: 'Produk Pilihan', icon: Icons.shopping_bag),
            SizedBox(height: 8),
            ProductCard(),
          ],
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// JUDUL SECTION
// -------------------------------------------------------------
class SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;

  const SectionTitle({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.teal.shade800),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade800,
          ),
        ),
      ],
    );
  }
}

// -------------------------------------------------------------
// BANNER PROMO (Stack + Positioned)
// -------------------------------------------------------------
class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Colors.teal.shade700, Colors.teal.shade300],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Stack(
        children: [
          // Ikon dekorasi di kanan bawah
          Positioned(
            right: 12,
            bottom: 8,
            child: Icon(
              Icons.local_offer,
              size: 80,
              color: Colors.teal.shade100,
            ),
          ),
          // Label diskon di kanan atas
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'DISKON 20%',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          // Teks promo di kiri bawah
          const Positioned(
            left: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PROMO AKHIR TAHUN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Belanja hemat, gratis ongkir!',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------------------
// KARTU PROFIL MAHASISWA (StatelessWidget)
// -------------------------------------------------------------
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Ikon profil
            CircleAvatar(
            radius: 36,
            backgroundColor: Colors.teal.shade100,
            backgroundImage: const AssetImage('assets/images/profil.png'),
            ),
            const SizedBox(width: 16),
            // Data mahasiswa
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ari Rizal Zalaludin',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text('NIM: 20240040042'),
                  const Text('Prodi: Teknik Informatika'),
                  const Text('Kelas: TI24M'),
                  const SizedBox(height: 8),
                  // 5 ikon bintang
                  Row(
                    children: List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// KARTU PRODUK (StatefulWidget)
// -------------------------------------------------------------
class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  // Data produk
  final String productName = 'Wireless Headphone XY-100';
  final String category = 'Elektronik';
  final int price = 150000;

  // State
  bool isFavorite = false;
  int likeCount = 24;
  int quantity = 1;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      likeCount += isFavorite ? 1 : -1;
    });
  }

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    // Jumlah minimal adalah 1
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  void addToCart() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.teal,
        behavior: SnackBarBehavior.floating,
        content: Text(
          '$quantity x $productName berhasil ditambahkan ke keranjang',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int totalPrice = price * quantity;

    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder gambar produk
          Container(
            height: 160,
            width: double.infinity,
            color: Colors.teal.shade100,
            child: Stack(
              children: [
               Positioned.fill(
                child: Image.asset(
                  'assets/images/produk.jpg',
                  fit: BoxFit.cover,
                ),
              ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama, kategori, harga
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Kategori: $category',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                const SizedBox(height: 4),
                Text(
                  formatRupiah(price),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade800,
                  ),
                ),
                const Divider(height: 24),

                // Tombol Favorite + jumlah Like
                Row(
                  children: [
                    IconButton(
                      onPressed: toggleFavorite,
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      '$likeCount Like',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Pengatur jumlah produk
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Jumlah',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        IconButton.outlined(
                          onPressed: quantity > 1 ? decreaseQuantity : null,
                          icon: const Icon(Icons.remove),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            '$quantity',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton.outlined(
                          onPressed: increaseQuantity,
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Total harga
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Harga'),
                      Text(
                        formatRupiah(totalPrice),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Tombol Tambah ke Keranjang
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: addToCart,
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text('Tambah ke Keranjang'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
