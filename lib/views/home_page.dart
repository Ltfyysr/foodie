import 'package:flutter/material.dart';
import 'package:foodie/colors.dart';
import 'package:foodie/views/cart_page.dart';
import 'package:foodie/views/drawer_page.dart';
import 'package:foodie/views/foods_page.dart';
import 'package:foodie/views/profil_page.dart';
import 'package:foodie/views/search_page.dart';
import 'package:foodie/views/show_categories.dart';
import 'package:foodie/views/show_choices.dart';
import 'package:foodie/views/show_populars.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: color3),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: IconButton(
                onPressed: () {
                },
                icon: Icon(Icons.favorite_border_rounded)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0.5, bottom: 8, left: 8, right: 8),
                  child: Card(
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Icon(
                                Icons.search_rounded,
                                color: color5,
                                size: 26,
                              ),
                            ),
                            Text(
                              "Search",
                              style: TextStyle(color: color5,fontSize: 14),
                            )
                          ],
                        )),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ),
              ShowCategories(),
              mainText(text: "Our Picks For You"),
              ShowChoices(),
              mainText(text: "Most Popular"),
              ShowPopulars(),
            ]),
      ),
      floatingActionButton: floatingActions(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigations(colors: anaRenk,),
      drawer: const DrawerPage(),
    );
  }
}

class floatingActions extends StatelessWidget {
  const floatingActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));},
      child: Icon(
        Icons.home,
        color: color4,
      ),
      backgroundColor: color3,
    );
  }
}

class bottomNavigations extends StatelessWidget {
  final Color colors;

  bottomNavigations({required this.colors});

  @override
  Widget build(BuildContext context) {
    return  BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: colors,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.receipt),
            onPressed: () {
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: IconButton(
              icon: Icon(Icons.fastfood_rounded),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodsPage()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: IconButton(
              icon: Icon(Icons.shopping_basket_rounded),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilPage()));
            },
          ),
        ],
      ),
    );
  }
}

class mainText extends StatelessWidget {
  final String text;


  mainText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold,fontFamily: "Poppins-700", color: color3),
          ),
          Text("See All",style: TextStyle(color: color5,fontFamily: "Poppins-300"),)
        ],
      ),
    );
  }
}