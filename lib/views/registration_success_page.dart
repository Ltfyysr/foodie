import 'package:flutter/material.dart';
import 'package:foodie/colors.dart';
import 'package:foodie/views/login_page.dart';

class RegistrationSuccessPage extends StatefulWidget {
  const RegistrationSuccessPage({Key? key}) : super(key: key);

  @override
  State<RegistrationSuccessPage> createState() =>
      _RegistrationSuccessPageState();
}

class _RegistrationSuccessPageState extends State<RegistrationSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: anaRenk,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: 400,
                height: 400,
                child: Image.asset("images/registration.png")),
            SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage()));
                  },
                  child: const Text("Continue"),
                  style: ElevatedButton.styleFrom(
                      primary: color2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ))
          ],
        ),
      ),
    );
  }
}
