import 'package:flutter/material.dart';
import 'package:foodie/entity/populars.dart';

class ShowPopulars extends StatefulWidget {
  const ShowPopulars({Key? key}) : super(key: key);

  @override
  State<ShowPopulars> createState() => _ShowPopularsState();
}

class _ShowPopularsState extends State<ShowPopulars> {
  Future<List<Populars>> ShowPopulars() async {
    var popularsList = <Populars>[];

    var p1 = Populars(popularId: 1, popularImageName: "yemek2.png",popularName: "Meat");
    var p2 = Populars(popularId: 2, popularImageName: "yemek3.png",popularName: "Kebap");
    var p3 = Populars(popularId: 3, popularImageName: "yemek4.png",popularName: "Steak");
    var p4 = Populars(popularId: 4, popularImageName: "yemek5.png",popularName: "Pizza");
    var p5 = Populars(popularId: 4, popularImageName: "yemek6.png",popularName: "Hamburger");
    var p6 = Populars(popularId: 4, popularImageName: "yemek7.png",popularName: "Pasta");

    popularsList.add(p1);
    popularsList.add(p2);
    popularsList.add(p3);
    popularsList.add(p5);
    popularsList.add(p4);
    popularsList.add(p6);

    return popularsList;}
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: FutureBuilder<List<Populars>>(
            future: ShowPopulars(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var popularsList = snapshot.data;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularsList!.length,
                  itemBuilder: (context, indeks) {
                    var popular = popularsList[indeks];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 150,
                          child: Card(
                            elevation: 0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 6),
                                      child: Image.asset("images/${popular.popularImageName}"),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 24),
                                  child: Center(
                                      child: Text(
                                        popular.popularName,
                                        style: const TextStyle(
                                            fontSize: 14, fontWeight: FontWeight.bold,fontFamily: "OpenSans-regular"),
                                        maxLines: 2,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],

                    );
                  },
                );
              } else {
                return const Center();
              }
            },
          )),
    );
  }
}