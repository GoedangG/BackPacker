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

# TUGAS 8

### 1. Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
1. `Navigator.push`:
- Metode ini digunakan untuk menambahkan layar baru ke tumpukan (stack) navigasi.
- Ketika menggunakan Navigator.push(), layar baru ditambahkan di atas layar yang ada di tumpukan, dan pengguna dapat kembali ke layar sebelumnya dengan menekan tombol kembali.
- Cocok digunakan ketika ingin menambahkan layar baru dan memungkinkan pengguna untuk kembali ke layar sebelumnya.

2. `Navigator.pushReplacement()`:
- Metode ini digunakan untuk menambahkan layar baru ke tumpukan dan menggantikan layar yang ada di tumpukan dengan layar baru.
- Ketika menggunakan Navigator.pushReplacement(), layar yang ada di bawah layar baru dihapus dari tumpukan, sehingga ketika pengguna menekan tombol kembali, mereka langsung kembali ke layar sebelumnya sebelum layar yang baru ditambahkan.
- Cocok digunakan ketika ingin menggantikan layar saat ini dengan layar baru dan tidak ingin pengguna kembali ke layar sebelumnya.

### 2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
- `Container` : Digunakan untuk mengelompokkan widget lain dan mengatur terhadap layout attribute seperti margin dan padding.
- `Column` : Digunakan untuk menampilkan widget dalam susunan vertikal.
- `Row` : Digunakan untuk menampilkan widget dalam susunan horizontal.
- `ListView` : Digunakan untuk menampilkan daftar elemen scrollable.
- `Stack` : Digunakan untuk "menumpuk" widget satu di atas yang lain.

### 3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
Pada tugas kali ini saya hanya menggunakan `TextFormField()` karena pada tugas kali ini hanya membutuhkan input berupa `String` dan `integer`.

### 4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
Penerapannya dibagi menjadi 3 lapisan utama:
1. Domain Layer:
- Berisi aturan bisnis atau logika inti aplikasi.
- Tidak bergantung pada detail implementasi atau teknologi tertentu.
- Termasuk use case, entitas, dan repositori yang menentukan kontrak untuk mengakses data.

2. Data Layer:
- Menangani pengambilan dan penyimpanan data.
- Implementasi dari repositori dan sumber data (API, database, dll.) 
- Merupakan jembatan antara Domain Layer dan Presentation Layer.

3. Presentation Layer:
- Menangani tampilan dan antarmuka pengguna.
- Bergantung pada Domain Layer, tetapi tidak mengetahui detail implementasi Data Layer.
- State management, UI, dan navigasi berada di dalamnya.

### 4.  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
1. membuat file `BackPackForm.dart` didalam folder `lib/screens` dan menambahkan code berikut:
    ```
    import 'package:flutter/material.dart';
    import 'package:bayu_inventory/widgets/left_drawer.dart';

    class Item {
    static List<Item> itemList = [];
    String name;
    int amount;
    String description;

    Item(this.name, this.amount, this.description);
    }

    class BackPackForm extends StatefulWidget{
    const BackPackForm({super.key});
    
    @override
    State<BackPackForm> createState() => _BackPackFormState();
    }

    class _BackPackFormState extends State<BackPackForm> {
    final _formkey = GlobalKey<FormState>();
    String _name = "";
    int _amount = 0;
    String _description = "";
    
    @override
    Widget build(BuildContext context){
        return Scaffold(
        appBar: AppBar(
            title: const Center(
            child: Text(
                'Form Tambah Item',
            ),
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: Form(
            key: _formkey,
            child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                    hintText: "Nama Item",
                    labelText: "Nama Item",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                    ),
                    onChanged: (String? value){
                    setState(() {
                        _name = value!;
                    });
                    },
                    validator: (String? value){
                    if (value == null || value.isEmpty){
                        return "Nama Item tidak boleh kosong!";
                    }
                    return null;
                    },
                ),
                ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                    hintText: "Jumlah",
                    labelText: "Jumlah",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                    ),
                    ),
                    onChanged: (String? value){
                    setState(() {
                        _amount = int.parse(value!);
                    });
                    },
                    validator: (String? value){
                    if (value == null || value.isEmpty){
                        return "Jumlah Item tidak boleh kosong";
                    }

                    if(int.tryParse(value) == null){
                        return "Harus berupa angka!";
                    }
            
                    return null;
                    },
                ),
                ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    ),
                    onChanged: (String? value){
                    setState(() {
                        _description = value!;
                    });
                    },
                    validator: (String? value){
                    if (value == null || value.isEmpty){
                        return "Description tidak boleh kosong!";
                    }
                    return null;
                    },
                ), 
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                        ),
                        onPressed: (){
                        if (_formkey.currentState!.validate()){
                            showDialog(
                            context: context,
                            builder: (context){
                                return AlertDialog(
                                title:  const Text('Item berhasil tersimpan'),
                                content: SingleChildScrollView(
                                    child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text('Nama Item: $_name'),
                                        Text('Amount: $_amount'),
                                        Text('Description: $_description'),
                                    ],
                                    ),
                                ),
                                actions: [
                                    TextButton(
                                    child: const Text('OK'),
                                    onPressed: (){
                                        Navigator.pop(context);
                                        Item.itemList.add(Item(_name, _amount, _description));
                                    },
                                    ),
                                ],
                                );
                            }
                            );
                        }
                        _formkey.currentState!.reset();
                        },
                        child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                        ),
                    ),
                    ),
                )
            ],),
            ),
        ),
        );
    }
    }
    ```
2. Menambahkan routing pada `item_cards.dart` dan `left_drawer.dart`
- `left_drawer.dart`:
    ```
    ListTile(
        leading: const Icon(Icons.add_shopping_cart),
        title: const Text('Tambah Item'),
        // Bagian redirection ke ShopFormPage
        onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                builder: (context) => const BackPackForm(),
                ));
            },
        ),
    ```

- `item_cards.dart`:
    ```
    if (item.name == "Tambah Item"){
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => const BackPackForm())
        );
    }
    ```

# TUGAS 9

### 1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?


### 2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

### 3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.

### 4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

### 5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

### 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).