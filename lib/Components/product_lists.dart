import 'package:flutter/material.dart';
import '../Models/cart.dart'; // import model cart.dart

class ProductList extends StatelessWidget {
  final List<Cart> carts;
  ProductList(this.carts);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: carts.isEmpty ? Column(children: <Widget> [
        //MAKA TAMPILKAN WIDGET TEXT UNTUK MEMBERIKAN INFORMASI BAHWA TIDAK ADA
        Text(
          "No Transaction Data",
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.title,
        ),
        //SELAIN ITU, MAKA DATA CARTS AKAN DILOOPING MENGGUNAKAN LISTVIEW.BUILDER
      ],): ListView.builder(
          itemBuilder: (context, index){
            return Card(
              child: Row(
                children: <Widget> [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor, width: 2)),
                  child: Text(
                    carts[index].qty.toString(),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      // ignore: deprecated_member_use
                      Text(carts[index].title, style: Theme.of(context).textTheme.title,),
                      Text('Harga: Rp' + carts[index].harga.toStringAsFixed(0), style: TextStyle(fontSize: 12, color: Colors.grey),),

                    ],
                  ),
                ],
              ),
            );
          },
        itemCount: carts.length, //JUMLAH ITEMNYA BERDASARKAN JUMLAH DATA YANG ADA DI DALAM CARTS
      ),
    );
  }
}
