import 'package:flutter/material.dart';

import './Components/add_new_item.dart';
import './Components/dashboard.dart';
import './Components/product_lists.dart';
import './Models/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Pengingat Belanja',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.yellowAccent,
        textTheme:  ThemeData.light().textTheme.copyWith(
          title: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
          home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Cart> _carts= [
    Cart(id: 'DW1', title: 'Sabun Mandi', harga: 15000, qty: 1),
    Cart(id: 'DW2', title: 'Shampoo', harga: 17000, qty: 2),
    Cart(id: 'DW3', title: 'KAMBING', harga: 17000, qty: 21),

  ];
  void _openModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddNewItem(_addNewItem); //DAN ISI DARI MODAL TERSEBUT ADALAH COMPONENT AddNewItem. PASTINYA PARAMETER YANG DIKIRIM ADALAH SEBUAH FUNGSI BERNAMA _addNewItem, MAKA PERLU KITA DEFINISIKAN SELANJUTNYA
        });
  }

  //FUNGSI INI UNTUK MEMANIPULASI DENGAN MENAMBAHKAN DATA BARU KE DALAM CART
  void _addNewItem(String title, double harga, int qty) {
    //BUAT FORMAT DATANYA DENGAN REFERENSI MENGGUNAKAN MODAL Cart
    final newItem = Cart(id: DateTime.now().toString(), title: title, harga: harga, qty: qty);
    setState(() {
      _carts.add(newItem); //SET STATE-NYA UNTUK MENAMBAHKAN DATA BARU TERSEBUT
    });
  }

  //FUNGSI INI UNTUK MENGHAPUS SEMUA DATA PADA VARIABLE CARTS
  void _resetCarts() {
    setState(() {
      _carts.clear(); //SET STATENYA KEMUDIAN CLEAR
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.shopping_cart),
        centerTitle: true,
        actions: [
          Icon(Icons.search),
          FlatButton(child: Icon(Icons.clear, color: Colors.white,), onPressed: () => _resetCarts(),)

        ],
        title: Text("Daftar Belanjaan"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Dashboard(_carts), //TAMBAHKAN CODE INI, KITA LETAKKAN DIATAS WIDGET SEBELUMNYA KARENA POSISINYA JUGA AKAN DIRENDER SEBELUM LIST KERANJANG
            // nanti kisa isi dengan widget
            ProductList(_carts), //TAMBAHKAN BAGIAN INI

          ],
        ),
      ),
      //TAMBAHKAN CODE INI
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openModal(context), //KETIKA DITEKAN MENJALANKAN FUNGSI _openModal
      ),
    );
  }
}
