import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/colors.dart';
import 'package:foodie/cubit/cart_page_cubit.dart';
import 'package:foodie/entity/sepet_yemekler.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    context.read<CartPageCubit>().sepettekileriGetir();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("My Basket",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: anaRenk)),
        centerTitle: true,
      ),
      body: BlocBuilder<CartPageCubit,List<SepetYemekler>>(
        builder: (context,sepetYemeklerListesi){
          if(sepetYemeklerListesi.isNotEmpty){
            return ListView.builder(
              itemCount: sepetYemeklerListesi.length,
                itemBuilder: (context,index){
                var sepet = sepetYemeklerListesi[index];
                return Column(
                  children: [
                    Container(
                      width: 400,
                      height: 100,
                      child: Card(
                        child: Row(
                          children: [
                            CircleAvatar(backgroundImage: NetworkImage("http://kasimadalan.pe.hu/yemekler/resimler/${sepet.yemek_resim_adi}"),),
                            Text(sepet.yemek_adi),
                            Text(sepet.yemek_siparis_adet + "adet"),
                            Text(sepet.yemek_fiyat +"₺"),
                            IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline_rounded))
                          ],
                        ),
                      ),
                    ),
                  ],
                );
                });
          }else{
            return const Center();
          }
        },
      ),
    );
  }
}
