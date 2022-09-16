import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:foodie/colors.dart';
import 'package:foodie/service/auth.dart';
import 'package:foodie/views/home_page.dart';
import 'package:foodie/views/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var tfEmail = TextEditingController();
  var tfPassword = TextEditingController();

  AuthService _authService= AuthService();


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
                  child: TextField(controller: tfEmail,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: color5),
                      filled: true,
                      fillColor: color4,
                      icon: Icon(Icons.mail),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),),
              ),
              Padding(
                padding:
                ProjectPaddings.textFieldPadding,
                  child: TextField( obscureText: true,
                    controller: tfPassword,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: color5),
                      filled: true,
                      fillColor: color4,
                      icon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),)
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
                        if (tfEmail.text.isEmpty ||
                          tfPassword.text.isEmpty){
                        AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            title: "Warning!",
                            desc: "Please fill in all fields",
                            btnOkColor: color8,
                            btnOkOnPress: () {})
                          .show();

                      } else if (tfPassword.text.length <8 ) {
                        AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            animType: AnimType.SCALE,
                            title: "Error!",
                            desc: "The password you enter must be at least 8 characters long!",
                            btnOkColor: color8,
                            btnOkOnPress: () {Navigator.pop(context);})
                          .show();
                      } else {
                        if (!emailValid(tfEmail.text)) {
                          AwesomeDialog(
                              context: context,
                              dialogType: DialogType.ERROR,
                              animType: AnimType.SCALE,
                              title: "Warning!",
                              desc: "Please enter a valid email!",
                              btnOkColor: color8,
                              btnOkOnPress: () {Navigator.pop(context);})
                            .show();
                        } else {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              });
                            _authService.signIn(tfEmail.text, tfPassword.text).then((value){
                              return Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()),);
                            });
                         }}

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

  bool emailValid(String email) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}


