import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodie/colors.dart';
import 'package:foodie/views/cart_page.dart';
import 'package:foodie/views/payment_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Completer<GoogleMapController> haritaKontrol = Completer();

  List<Marker> isaretler = <Marker>[];
  var baslangicKonum =
      CameraPosition(target: LatLng(38.7412482, 26.1844276), zoom: 4);

  Future<void> konumaGit() async {
    final GoogleMapController controller = await haritaKontrol.future;
    var gidilecekIsaret = Marker(
      markerId: MarkerId("Id"),
      position: LatLng(41.0370014, 28.9763369),
      infoWindow: InfoWindow(title: "İstanbul", snippet: "Evim"),
    );
    setState(() {
      isaretler.add(gidilecekIsaret);
    });
    var gidilecekKonum =
        CameraPosition(target: LatLng(41.0370014, 28.9763369), zoom: 15);
    controller.animateCamera(CameraUpdate.newCameraPosition(gidilecekKonum));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            icon: Icon(Icons.arrow_back, color: anaRenk)),
        title: Text("Location",style: TextStyle(fontFamily: "OpenSans-regular",color: anaRenk,fontSize: 20),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          SizedBox(
            width: 400,
            height: 400,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: baslangicKonum,
              markers: Set<Marker>.of(isaretler),
              onMapCreated: (GoogleMapController controller) {
                haritaKontrol.complete(controller);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                icon: Icon(Icons.location_pin, color: Colors.white),
                label: Text("Find Location"),
                onPressed: () {
                  konumaGit();
                },
                style: ElevatedButton.styleFrom(
                    primary: anaRenk,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.done, color: Colors.white),
                label: Text("Approve"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentPage()));
                },
                style: ElevatedButton.styleFrom(
                    primary: anaRenk,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
