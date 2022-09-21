import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/colors.dart';
import 'package:foodie/cubit/cart_page_cubit.dart';
import 'package:foodie/entity/sepet_yemekler.dart';
import 'package:foodie/entity/yemekler.dart';
import 'package:foodie/repo/usersdao_repository.dart';
import 'package:foodie/views/foods_details_page.dart';
import 'package:foodie/views/home_page.dart';
import 'package:foodie/views/payment_page.dart';


class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var currentUserId;
  var urepo = UserRepository();
  var totalBasket=0;
  @override
  void initState() {
    super.initState();
    urepo.getUserId().then((userId) {
      currentUserId = userId;
      urepo.getUser(currentUserId).then((user) {
        user = user;
        context.read<CartPageCubit>().get(user.userName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            icon: Icon(Icons.arrow_back, color: anaRenk)),
        title: Text("My Basket",
            style: TextStyle(
                fontSize: 20,fontFamily: "OpenSans-regular", fontWeight: FontWeight.bold, color: anaRenk)),
        centerTitle: true,
      ),
      body: BlocBuilder<CartPageCubit, List<SepetYemekler>>(
        builder: (context, sepetYemeklerListesi) {
          totalBasket = 0;
          for(var i = 0 ; i<sepetYemeklerListesi.length;i++){
            totalBasket += int.parse(sepetYemeklerListesi[i].yemek_fiyat) * int.parse(sepetYemeklerListesi[i].yemek_siparis_adet);
          }
          if (sepetYemeklerListesi.isNotEmpty) {
            return ListView.builder(
                itemCount: sepetYemeklerListesi.length,
                itemBuilder: (context, index) {
                  var yemek = sepetYemeklerListesi[index];
                  return GestureDetector(
                    onTap: () {
                      var ye = Yemekler(
                          yemek_id: "",
                          yemek_adi: yemek.yemek_adi,
                          yemek_resim_adi: yemek.yemek_resim_adi,
                          yemek_fiyat: yemek.yemek_fiyat);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodsDetailsPage(yemek: ye)),
                      );
                    },
                    child: Card(
                      elevation: 6,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundColor: color6,
                          backgroundImage: NetworkImage(
                            "http://kasimadalan.pe.hu/yemekresimler/${yemek.yemek_resim_adi}",
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                              "${yemek.yemek_siparis_adet} Adet ${yemek.yemek_adi}",
                              style: TextStyle(color: color3)),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "${int.parse(yemek.yemek_fiyat) * int.parse(yemek.yemek_siparis_adet)} ₺",
                            style: TextStyle(color: color8),
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("${yemek.yemek_adi} silinsin mi?"),
                                  action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: () {
                                      context.read<CartPageCubit>().delete(
                                          yemek.sepet_yemek_id,
                                          yemek.kullanici_adi);
                                      if(sepetYemeklerListesi.length  == 1){
                                        setState((){
                                          sepetYemeklerListesi.clear();
                                          totalBasket=0;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.delete_outline_rounded)),
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                    color: color4,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10.0))),
                child: Center(
                  child: Text(
                    "Empty Basket",
                    style: TextStyle(fontSize: 20, color: color6),
                  ),
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      backgroundColor: color4,
                      title: Text("Total Basket : ${totalBasket} ₺",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: color3),),
                      content: Text("Do you want to confirm?"),
                      actions:  [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(child: Text("No"),onPressed: (){
                              Navigator.pop(context);
                            }),

                            TextButton(child: Text("Yes"),onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage()));
                            }),
                          ],
                        )
                      ],);
                  }
              );
            },
            child: Text(
              "Confirm Cart",
              style: TextStyle(fontSize: 20,fontFamily: "OpenSans-regular"),
            ),
            style: ElevatedButton.styleFrom(primary: anaRenk),
          ),
        ),
      ),
    );
  }
}

