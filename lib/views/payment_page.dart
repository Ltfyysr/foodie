import 'package:flutter/material.dart';
import 'package:foodie/colors.dart';
import 'package:foodie/views/order_page.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int radioDeger1 =0;
  int radioDeger2 =0;
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
                        height: 180,
                        color: color9,
                        child: Column(
                          children: [
                           RadioListTile(
                             title: Text("Online payment"),
                               value: 1,
                               groupValue: radioDeger1,
                               activeColor: anaRenk,
                               onChanged: (int? veri){
                               setState((){
                                 radioDeger1=veri!;
                               });
                               }
                               ),
                            RadioListTile(
                             title: Text("Cash on delivery"),
                               value: 2,
                               groupValue: radioDeger1,
                               activeColor: anaRenk,
                               onChanged: (int? veri){
                               setState((){
                                 radioDeger1=veri!;
                               });
                               }
                               ),
                            RadioListTile(
                             title: Text("Card on delivery"),
                               value: 3,
                               groupValue: radioDeger1,
                               activeColor: anaRenk,
                               onChanged: (int? veri){
                               setState((){
                                 radioDeger1=veri!;
                               });
                               }
                               ),
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
                        height: 120,
                        color: color9,
                        child: Column(
                          children: [
                            RadioListTile(
                                title: Text("Now"),
                                value: 1,
                                groupValue: radioDeger2,
                                activeColor: anaRenk,
                                onChanged: (int? veri){
                                  setState((){
                                    radioDeger2=veri!;
                                  });
                                }
                            ),
                            RadioListTile(
                                title: Text("18:00"),
                                value: 2,
                                groupValue: radioDeger2,
                                activeColor: anaRenk,
                                onChanged: (int? veri){
                                  setState((){
                                    radioDeger2=veri!;
                                  });
                                }
                            ),
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

