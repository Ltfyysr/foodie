import 'package:flutter/material.dart';
import 'package:foodie/colors.dart';
import 'package:foodie/views/home_page.dart';
import 'package:foodie/views/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var tfUserName = TextEditingController();
  var tfPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: anaRenk,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: 300,
                  height: 400,
                  child: Image.asset("images/login.png")),
              SizedBox(height: 20),
              Padding(
                padding:
                ProjectPaddings.textFieldPadding,
                  child: shortTextField(ncontroller: tfUserName, hintText: "Username")
              ),
              Padding(
                padding:
                ProjectPaddings.textFieldPadding,
                  child: shortTextField(ncontroller: tfPassword, hintText: "Password")
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: const Text("Sign Up"),
                    style: ElevatedButton.styleFrom(
                        primary: anaRenk,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child:  Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: color3, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: anaRenk,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>const HomePage()));
                      },
                      child: const Text("Login"),
                      style: ElevatedButton.styleFrom(
                          primary: color2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
