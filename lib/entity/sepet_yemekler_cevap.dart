import 'package:foodie/entity/sepet_yemekler.dart';

class SepetYemeklerCevap {
  List<SepetYemekler> sepet_yemekler;
  int success;

  SepetYemeklerCevap({required this.sepet_yemekler, required this.success});

  factory SepetYemeklerCevap.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["sepet_yemekler"]  as  List;
    List<SepetYemekler> sepetYemekler = jsonArray.map((jsonArrayNesnesi) => SepetYemekler.fromJson(jsonArrayNesnesi))
        .toList();
    int success = json["success"] as int;
    return SepetYemeklerCevap(sepet_yemekler: sepetYemekler, success: success);
  }

}
