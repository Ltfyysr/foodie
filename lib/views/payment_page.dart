import 'package:flutter/material.dart';
import 'package:foodie/colors.dart';
import 'package:foodie/views/order_page.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color6,
      appBar: AppBar(
        backgroundColor: color6,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: anaRenk,
            )),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text("Payment Method"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Container(
                        width: 350,
                        height: 150,
                        color: color9,
                        child: Column(
                          children: [

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text("Delivery Time"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Container(
                        width: 350,
                        height: 100,
                        color: color9,
                        child: Column(
                          children: [
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18,top: 24),
                      child: Text("Delivery Address"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(),
                    ),
                    SizedBox(height: 18),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPage() ));
                        },
                        child: Text(
                          "Confirm and Finish",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),style: ElevatedButton.styleFrom(primary: anaRenk),),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
