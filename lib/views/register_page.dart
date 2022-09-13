import 'package:flutter/material.dart';
import 'package:foodie/colors.dart';
import 'package:foodie/views/registration_success_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var tfEmail = TextEditingController();
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
                  height: 350,
                  child: Image.asset("images/register.png")),
              Padding(
                  padding: ProjectPaddings.textFieldPadding,
                  child:
                      shortTextField(ncontroller: tfEmail, hintText: "Email")),
              Padding(
                  padding: ProjectPaddings.textFieldPadding,
                  child: shortTextField(
                      ncontroller: tfUserName, hintText: "Username")),
              Padding(
                  padding: ProjectPaddings.textFieldPadding,
                  child: shortTextField(
                      ncontroller: tfPassword, hintText: "Password")),
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
                                builder: (context) =>
                                    RegistrationSuccessPage()));
                      },
                      child: const Text("Register"),
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

class shortTextField extends StatelessWidget {
  const shortTextField({
    Key? key,
    required this.ncontroller,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController ncontroller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: ncontroller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: color5),
        filled: true,
        fillColor: color4,
        prefixIcon: Icon(Icons.lock, color: anaRenk),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class ProjectPaddings {
  static const textFieldPadding =
      EdgeInsets.symmetric(horizontal: 40, vertical: 10);
}
