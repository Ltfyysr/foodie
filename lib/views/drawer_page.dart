import 'package:flutter/material.dart';
import 'package:foodie/colors.dart';
import 'package:foodie/views/landing_page.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: anaRenk,
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello")
              ],
            ),
          ),

         drawerItems(icons: Icon(
           Icons.home,
           color: color3,
           size: 26,
         ), text: 'Home'),
          drawerItems(icons: Icon(
            Icons.settings,
            color: color3,
            size: 26,
          ), text: 'Settings'),
          drawerItems(icons: Icon(
            Icons.location_on_rounded,
            color: color3,
            size: 26,
          ), text: 'Location'),
          drawerItems(icons: Icon(
            Icons.notifications,
            color: color3,
            size: 26,
          ),text: 'Notifications'),
          drawerItems(icons: Icon(
            Icons.question_mark_rounded,
            color: color3,
            size: 26,
          ), text: "Whishlist"),
          SizedBox(height: 250),
          GestureDetector(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LandingPage()));},
            child: drawerItems(icons: Icon(Icons.login_rounded,color: color3,
              size: 26,),text: "Log Out"),
          ),
        ],
      ));

  }
}

class drawerItems extends StatelessWidget {
  const drawerItems({
    Key? key,
    required this.icons,
    required this.text,
  }) : super(key: key);

  final Icon icons;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child:icons,
          ),
          Text(
            text,
            style: TextStyle(color: color3,fontSize: 14),
          ),
        ],
      ),
    );
  }
}