import 'package:flutter/material.dart';
import 'package:foodie/colors.dart';

class  SearchPage extends StatefulWidget {
  const  SearchPage({Key? key}) : super(key: key);

  @override
  State< SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State< SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(decoration: const InputDecoration(hintText: "Search",focusedBorder: UnderlineInputBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),borderSide: BorderSide(color: Colors.teal))),
          onChanged: (aramaSonucu){},),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },icon: Icon(Icons.arrow_back,color: anaRenk,),),
      ),


    );
  }
}
