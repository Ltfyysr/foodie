import 'package:flutter/material.dart';

import '../colors.dart';
import 'home_page.dart';

class ProfilPage extends StatefulWidget{
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: CircleAvatar(backgroundImage: AssetImage("images/profil.png"),maxRadius: 80,),
            ),
            Text("Flutter",style: TextStyle(fontSize: 24,fontFamily: "OpenSans-regular"),),
          ],
        )
      ),
      floatingActionButton: floatingActions(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigations(colors: anaRenk,),
    );

  }
}
