import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/colors.dart';
import '../cubit/cart_page_cubit.dart';
import '../entity/yemekler.dart';
import '../repo/usersdao_repository.dart';

class FoodsDetailsPage extends StatefulWidget {
  Yemekler yemek;


  FoodsDetailsPage({required this.yemek});

  @override
  State<FoodsDetailsPage> createState() => _FoodsDetailsPageState();
}

class _FoodsDetailsPageState extends State<FoodsDetailsPage> {
  var urepo = UserRepository();
  late int yemek_siparis_adet = 1;
  bool favoriteButton = true;
  @override
  Widget build(BuildContext context) {

    var yemek = widget.yemek;
    int total = int.parse(yemek.yemek_fiyat) * yemek_siparis_adet;
    return Scaffold(
      backgroundColor: color6,
      appBar: AppBar(
        title: const Text(
          "Details",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: color6,
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: favoriteButton
                  ? IconButton(
                  onPressed: () {
                    setState(() {
                      favoriteButton = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("${widget.yemek
                            .yemek_adi} favorilere eklendi")));
                  },
                  icon: Icon(Icons.favorite_border_outlined))
                  : IconButton(
                  onPressed: () {
                    setState(() {
                      favoriteButton = true;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("${widget.yemek
                              .yemek_adi} favorilerden kaldırıldı")));
                    });
                  },
                  icon: Icon(Icons.favorite,color: Colors.red))),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: 500,
            height: 280,
            child: Image.network(
                "http://kasimadalan.pe.hu/yemekler/resimler/${yemek
                    .yemek_resim_adi}"),
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
                                  yemek_siparis_adet != 1 ? yemek_siparis_adet -= 1 : yemek_siparis_adet;
                                });
                              },
                              icon: Icon(
                                Icons.remove,
                                color: anaRenk,
                              )),
                          Text("$yemek_siparis_adet"),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  yemek_siparis_adet += 1;
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
                      "${total} ₺",
                      style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      urepo.getUserId().then((userId) {
                        urepo.getUser(userId).then((user) {
                          context
                              .read<CartPageCubit>()
                              .add(widget.yemek, user.userName, yemek_siparis_adet).then((
                              value) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("${widget.yemek
                                    .yemek_adi} sepete eklendi")));
                          });
                        });
                      });
                    },
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
