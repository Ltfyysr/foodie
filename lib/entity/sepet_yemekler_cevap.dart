import 'package:foodie/entity/sepet_yemekler.dart';

class SepetYemeklerCevap {
  List<SepetYemekler> sepetYemekler;
  int success;

  SepetYemeklerCevap({required this.sepetYemekler, required this.success});

  factory SepetYemeklerCevap.fromJson(Map<String, dynamic> json) {
    var jsonArray = ((json["sepetYemekler" ] ?? [ ])as List);
    List<SepetYemekler> sepetYemekler = jsonArray
        .map((jsonArrayNesnesi) => SepetYemekler.fromJson(jsonArrayNesnesi))
        .toList();
    int success = json["success"] as int;
    return SepetYemeklerCevap(sepetYemekler: sepetYemekler, success: success);
  }
}
