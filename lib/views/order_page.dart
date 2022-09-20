import 'package:flutter/material.dart';
import 'package:foodie/colors.dart';
import 'package:foodie/views/home_page.dart';

class OrderPage extends StatefulWidget{
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset("images/order.png"),
            Image.asset("images/thankyou.png"),
            ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));}, child: Text("GOT IT"),style: ElevatedButton.styleFrom(primary: anaRenk),),
          ],
        ),
      ),
    );
  }
}
