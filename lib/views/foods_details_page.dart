import 'package:flutter/material.dart';
import 'package:foodie/colors.dart';

import '../entity/yemekler.dart';

class FoodsDetailsPage extends StatefulWidget {
  Yemekler yemek;

  FoodsDetailsPage({required this.yemek});

  @override
  State<FoodsDetailsPage> createState() => _FoodsDetailsPageState();
}

class _FoodsDetailsPageState extends State<FoodsDetailsPage> {
  late int sayac = 1;

  @override
  Widget build(BuildContext context) {
    var yemek = widget.yemek;
    return Scaffold(
      backgroundColor: color6,
      appBar: AppBar(
        backgroundColor: color6,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: Icon(Icons.favorite_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: 500,
            height: 280,
            child: Image.network(
                "http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),
          ),
          Container(
            width: 500,
            height: 393,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              color: color4,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  yemek.yemek_adi,
                  style: TextStyle(
                      fontSize: 24, color: color3, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  sayac != 1 ? sayac -= 1 : sayac;
                                });
                              },
                              icon: Icon(
                                Icons.remove,
                                color: anaRenk,
                              )),
                          Text("$sayac"),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  sayac += 1;
                                });
                              },
                              icon: Icon(
                                Icons.add,
                                color: anaRenk,
                              ))
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: color7),
                    ),
                    Text(
                      "${int.parse(yemek.yemek_fiyat) * sayac} ₺",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("ADD TO CART"),
                    style: ElevatedButton.styleFrom(
                        primary: anaRenk,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
