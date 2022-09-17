import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/colors.dart';
import 'package:foodie/cubit/cart_page_cubit.dart';
import 'package:foodie/entity/sepet_yemekler.dart';
import 'package:foodie/entity/yemekler.dart';
import 'package:foodie/repo/usersdao_repository.dart';
import 'package:foodie/views/foods_details_page.dart';


class CartPage extends StatefulWidget {

  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var currentUserId;
  var urepo = UserRepository();


  @override
  void initState() {
    super.initState();
    urepo.getUserId().then((userId) {
      currentUserId = userId;
      urepo.getUser(currentUserId).then((user) {
       user = user;
        context.read<CartPageCubit>().sepettekileriGetir(user.userName);
      });
    });
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
                var yemek = sepetYemeklerListesi[index];
                return GestureDetector(
                  onTap: () {
                    var ye =Yemekler(
                        yemek_id: "",
                        yemek_adi: yemek.yemek_adi,
                        yemek_resim_adi: yemek.yemek_resim_adi,
                        yemek_fiyat: yemek.yemek_fiyat
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodsDetailsPage(yemek: ye)),
                    );
                  },
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundColor: color4,
                        backgroundImage: NetworkImage(
                          "http://kasimadalan.pe.hu/yemekresimler/${yemek.yemek_resim_adi}",
                        ),
                      ),
                      title: Text(
                        yemek.yemek_adi,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("${yemek.yemek_fiyat} ₺"),
                    ),
                  ),
                );
                });
          }else{
            return  Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: anaRenk,
                      borderRadius: const BorderRadius.all(Radius.circular(10.0))),
                  child: Center(
                    child: Text(
                      "Boş Sepet",
                      style: TextStyle(fontSize: 20, color: color4),
                    ),
                  ),

                ),
            );
          }
        },
      ),
    );
  }
}
