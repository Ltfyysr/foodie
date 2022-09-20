import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/colors.dart';
import 'package:foodie/cubit/foods_page_cubit.dart';
import 'package:foodie/entity/yemekler.dart';
import 'package:foodie/views/foods_details_page.dart';

class  SearchPage extends StatefulWidget {
  const  SearchPage({Key? key}) : super(key: key);

  @override
  State< SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State< SearchPage> {
  bool aramaYapiliyorMu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: anaRenk,
          title: aramaYapiliyorMu ?
          TextField(decoration: const InputDecoration(hintText: "Search"),
            onChanged: (aramaSonucu){
            context.read<FoodsPageCubit>().search(aramaSonucu);
            },)
              :  Text("Foods",style: TextStyle(fontSize: 16),),
          actions: [
            aramaYapiliyorMu ?
            IconButton(onPressed: () {
              setState(() {aramaYapiliyorMu= false;});
              context.read<FoodsPageCubit>().getFoods();
            }, icon: Icon(Icons.clear)) :
            IconButton(onPressed: () {
              setState(() {aramaYapiliyorMu= true;});
            }, icon: Icon(Icons.search))
          ],
      ),
      body: BlocBuilder<FoodsPageCubit,List<Yemekler>>(
          builder: (context,yemeklerListesi){
            if(yemeklerListesi.isNotEmpty){
              return ListView.builder(
                  itemCount: yemeklerListesi.length,
                  itemBuilder: (context,indeks){
                    var yemek= yemeklerListesi[indeks];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FoodsDetailsPage(
                                 yemek: yemek,
                                ))).then((value) {
                          context.read<FoodsPageCubit>().getFoods();
                        });
                      },
                      child: Card(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${yemek.yemek_adi}"),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              );
            }else{
              return const Center();
            }
          }
      )  ,
    );
  }
}
