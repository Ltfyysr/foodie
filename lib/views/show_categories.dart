import 'package:flutter/material.dart';
import 'package:foodie/colors.dart';
import '../entity/categories.dart';

class ShowCategories extends StatefulWidget {
  const ShowCategories({Key? key}) : super(key: key);

  @override
  State<ShowCategories> createState() => _ShowCategoriesState();
}

class _ShowCategoriesState extends State<ShowCategories> {
  Future<List<Categories>> showCategories()async{
    var categoriesList = <Categories>[];

    var c1 = Categories(categoriId: 1, categoriName: "All");
    var c2 = Categories(categoriId: 2, categoriName: "Pizza");
    var c3 = Categories(categoriId: 3, categoriName: "Steak");
    var c4 = Categories(categoriId: 4, categoriName: "Coffee");
    var c5 = Categories(categoriId: 5, categoriName: "Pasta");
    var c6 = Categories(categoriId: 6, categoriName: "Veggies");
    var c7 = Categories(categoriId: 7, categoriName: "Drinks");
    var c8 = Categories(categoriId: 8, categoriName: "Ice cream");
    categoriesList.add(c1);
    categoriesList.add(c2);
    categoriesList.add(c3);
    categoriesList.add(c4);
    categoriesList.add(c5);
    categoriesList.add(c6);
    categoriesList.add(c7);
    categoriesList.add(c8);
    return categoriesList;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: FutureBuilder<List<Categories>>(
            future: showCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var categoriesList = snapshot.data;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList!.length,
                  itemBuilder: (context, indeks) {
                    var categori = categoriesList[indeks];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("${categori.categoriName}"),
                        style: ElevatedButton.styleFrom(
                            primary: anaRenk,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
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