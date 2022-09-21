import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:foodie/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie/entity/users.dart';
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
      appBar: AppBar(
        backgroundColor: anaRenk,
      ),
      backgroundColor: anaRenk,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: 300,
                  height: 250,
                  child: Image.asset("images/register.png")),
              Padding(
                padding: ProjectPaddings.textFieldPadding,
                child: TextFormField(
                  controller: tfEmail,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) {},
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: color5),
                    filled: true,
                    icon: Icon(Icons.mail),
                    fillColor: color4,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),),
              Padding(
                  padding: ProjectPaddings.textFieldPadding,
                  child: TextField(
                    controller: tfUserName,
                    decoration: InputDecoration(
                      hintText: "UserNname",
                      hintStyle: TextStyle(color: color5),
                      filled: true,
                      fillColor: color4,
                      icon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  )),
              Padding(
                  padding: ProjectPaddings.textFieldPadding,
                  child: TextField(
                    obscureText: true,
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
                    ),
                  )
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
                            btnOkOnPress: () {})
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
                              btnOkOnPress: () {})
                            .show();
                        } else {
                          signUp();
                        }
                      }
                    },
                    child: const Text("Register"),
                      style: ElevatedButton.styleFrom(
                          primary: color2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                  ),
                )),
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: tfEmail.text,
          password: tfPassword.text);

      try {
        FirebaseAuth auth = FirebaseAuth.instance;
        var userId = auth.currentUser!.uid;

        final doc = FirebaseFirestore.instance.collection("users").doc(userId);
        final json = {
          'email': tfEmail.text,
          'userName': tfUserName.text,
          'timestamp': DateTime.now(),
        };
        print("$json");
        var user = Users(
            email: tfEmail.text,
            userName: tfUserName.text,
            timeStamp: DateTime.now());
        var newJson = user.toJson();
        await doc.set(newJson);

      } catch (Exception) {}

      Navigator.pushReplacement(context,
          (MaterialPageRoute(
              builder: (context) =>
                  RegistrationSuccessPage(
                    firstTimeLogin: true,
                  ))));
    } on FirebaseAuthException catch (e) {
      print(e.message);

      if (e.code == "email-already-in-use") {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.SCALE,
            title: "Warning!",
            desc: "Such an account already exists",
            btnOkColor: color8,
            btnOkOnPress: () {
              Navigator.pop(context);
            })
            .show();
      } else {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.SCALE,
            title: "Warning!",
            desc: "You entered incorrect information",
            btnOkColor: color8,
            btnOkOnPress: () {})
            .show();
      }
    } finally{}
  }

  bool emailValid(String email) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
class ProjectPaddings {
  static const textFieldPadding =
      EdgeInsets.symmetric(horizontal: 40, vertical: 10);
}
