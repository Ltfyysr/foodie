import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:foodie/entity/yemekler.dart';
import '../entity/sepet_yemekler.dart';
import '../entity/sepet_yemekler_cevap.dart';

class SepetYemeklerDaoRepository {

  List<SepetYemekler> parseSepetYemeklerCevap(String cevap) {
    var jsonVeri = json.decode(cevap);
    var sepetYemeklerCevap = SepetYemeklerCevap.fromJson(jsonVeri);
    return sepetYemeklerCevap.sepet_yemekler;
  }

  Future<void> addToSepet(
      Yemekler yemek,String kullanici_adi, int yemek_siparis_adet) async {

    var url = "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php";
    var veri = {
      "yemek_adi": yemek.yemek_adi,
      "yemek_resim_adi": yemek.yemek_resim_adi,
      "yemek_fiyat": yemek.yemek_fiyat,
      "yemek_siparis_adet": yemek_siparis_adet,
      "kullanici_adi": kullanici_adi
    };

    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("Sepete yemek ekle: ${cevap.data.toString()}");
  }

  Future<List<SepetYemekler>> getBasket(String kullanici_adi) async{
    var url="http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php";
    var veri = {"kullanici_adi": kullanici_adi};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    return  parseSepetYemeklerCevap(cevap.data.toString());
  }
}


