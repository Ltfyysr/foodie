import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/colors.dart';
import 'package:foodie/cubit/foods_page_cubit.dart';
import 'package:foodie/entity/yemekler.dart';
import 'package:foodie/views/home_page.dart';

import 'foods_details_page.dart';

class FoodsPage extends StatefulWidget {
  const FoodsPage({Key? key}) : super(key: key);

  @override
  State<FoodsPage> createState() => _FoodsPageState();
}

class _FoodsPageState extends State<FoodsPage> {

  @override
  void initState() {
    super.initState();
    context.read<FoodsPageCubit>().yemekleriGetir();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color4,
        title: Text(
          "Foods",
          style: TextStyle(fontWeight: FontWeight.bold, color: anaRenk,fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<FoodsPageCubit,List<Yemekler>>(
        builder: (context,yemeklerListesi){
          if(yemeklerListesi.isNotEmpty){
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 2 / 2.6),
              itemCount: yemeklerListesi.length,
                itemBuilder: (context,index){
                var yemek = yemeklerListesi[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodsDetailsPage(yemek: yemek,)));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: 185,
                    height: 200,
                    child: Card(
                      color: color7,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(Icons.radio_button_checked_rounded,
                                    color: anaRenk),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:
                                Icon(Icons.favorite_rounded, color: color5),
                              ),
                            ],
                          ),
                          CircleAvatar(backgroundImage: NetworkImage(
                          "http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),maxRadius: 60,backgroundColor: color6,),
                          SizedBox(height: 8),
                          Text(
                            yemek.yemek_adi,
                            style: TextStyle(color: color5,fontSize: 18,fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: Text(
                                 "${yemek.yemek_fiyat} ₺",
                                  style: TextStyle(color: anaRenk,fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  (Icons.add_circle),
                                  color: anaRenk,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
                }
            );
          }else{
            return const Center();
          }
        }
      ),
      floatingActionButton: floatingActions(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigations(colors: anaRenk,),
    );
  }
}
