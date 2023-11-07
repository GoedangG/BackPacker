# Nama        : Rizqi Bayu Utama
# NPM         : 2206826330
# Kelas       : PBP - C

# Jawaban Tugas 7

### 1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
`StatelessWidget` digunakan untuk widget yang tidak perlu berubah atau memiliki state internal, sedangkan `StatefulWidget` digunakan untuk widget yang memerlukan pembaruan tampilan berdasarkan perubahan state.

### 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
1. MyHomePage (StatelessWidget): Ini adalah widget utama yang mewakili halaman beranda aplikasi.
2. Scaffold: Ini adalah widget yang digunakan untuk membuat tata letak dasar aplikasi, termasuk AppBar dan konten tubuh (body).
3. AppBar: Ini adalah widget yang mewakili bilah atas (app bar) aplikasi dengan judul "Backpacknya Bayu".
4. SingleChildScrollView: Ini adalah widget yang mengelilingi konten tubuh untuk mengaktifkan guliran jika kontennya lebih besar dari layar.
5. Padding: Ini adalah widget yang digunakan untuk memberikan padding ke dalam kontennya.
6. Column: Ini adalah widget yang digunakan untuk mengatur anak-anaknya secara vertikal.
7. Text: Ini adalah widget yang digunakan untuk menampilkan teks "Backpacknya Bayu" dengan gaya teks tertentu.
8. GridView.count: Ini adalah widget yang digunakan untuk membuat tampilan grid dengan jumlah kolom yang diberikan (3 kolom dalam hal ini).
9. ShopCard (StatelessWidget): Ini adalah widget yang digunakan untuk mewakili setiap item toko (kartu) dalam grid. Ini mengambil properti dari objek ShopItem dan menggambarkannya.
10. Material: Ini adalah widget yang digunakan untuk memberikan latar belakang warna untuk setiap ShopCard.
11. InkWell: Ini adalah widget yang digunakan untuk membuat area yang responsif terhadap sentuhan dan menampilkan SnackBar ketika card diklik.
12. Icon: Ini adalah widget yang digunakan untuk menampilkan ikon dengan warna putih.
13. Text: Ini adalah widget yang digunakan untuk menampilkan nama item dalam card dengan teks putih.

### 3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
1. Membuat aplikasi dengan cara:
    ```
    flutter create <app_name>
    cd <app_name>
    ```

2. Membuat file baru `menu.dart` dan menambahkan code berikut:
    ```dart
    import 'package:tikoes/menu.dart';
    ```

3. Mengubah file `main.dart` sehingga menjadi berikut:
    ```dart
    import 'package:bayu_inventory/menu.dart';
    import 'package:flutter/material.dart';

    void main() {
    runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
            useMaterial3: true,
        ),
        home: MyHomePage(),
        );
        }
    }
    ```

4. Mengubah file `menu.dart` sehingga menjadi:
```dart
    import 'package:flutter/material.dart';

    class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, Colors.lightBlue),
        ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.blueGrey),
        ShopItem("Logout", Icons.logout, Colors.red),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Text(
            'Backpacknya Bayu',
            ),
        ),
        body: SingleChildScrollView(
            // Widget wrapper yang dapat discroll
            child: Padding(
            padding: const EdgeInsets.all(10.0), // Set padding dari halaman
            child: Column(
                // Widget untuk menampilkan children secara vertikal
                children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                    child: Text(
                    'Backpacknya Bayu', // Text yang menandakan Inventory
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                    ),
                    ),
                ),
                // Grid layout
                GridView.count(
                    // Container pada card kita.
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ShopItem item) {
                    // Iterasi untuk setiap item
                    return ShopCard(item);
                    }).toList(),
                ),
                ],
            ),
            ),
        ),
        );
    }
    }
    class ShopItem {
    final String name;
    final IconData icon;
    final Color color;

    ShopItem(this.name, this.icon, this.color);
    }

    class ShopCard extends StatelessWidget {
    final ShopItem item;
    const ShopCard(this.item, {super.key}); // Constructor

    @override
    Widget build(BuildContext context) {
        return Material(
        color: item.color,
        child: InkWell(
            // Area responsive terhadap sentuhan
            onTap: () {
            // Memunculkan SnackBar ketika diklik
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
            },
            child: Container(
            // Container untuk menyimpan Icon dan Text
            padding: const EdgeInsets.all(8),
            child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(
                    item.icon,
                    color: Colors.white,
                    size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    ),
                ],
                ),
            ),
            ),
        ),
        );
        }
    }
```