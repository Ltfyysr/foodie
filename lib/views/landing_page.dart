import 'package:flutter/material.dart';
import 'package:foodie/colors.dart';
import 'package:foodie/views/login_page.dart';
import 'package:foodie/views/register_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      backgroundColor: anaRenk,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: 300,
                height: 300,
                child: Image.asset("images/foodie.png")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
                      },
                      child: const Text("Sign in",style: TextStyle(fontSize: 16),),
                      style: ElevatedButton.styleFrom(
                          primary: color1,
                          elevation: 3,
                          shape:const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          padding: EdgeInsets.all(20) //content),
                          )),
                ),
                SizedBox(
                  width: 150,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
                      },
                      child:  Text(
                        "Register",
                        style: TextStyle(color: color3,fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: color4,
                          elevation: 3,
                          shape:const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          padding: EdgeInsets.all(20) //content),
                          )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
