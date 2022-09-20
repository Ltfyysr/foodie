import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:foodie/entity/yemekler.dart';
import 'package:foodie/entity/yemekler_cevap.dart';

class YemeklerDaoRepository{

  List<Yemekler> parseYemeklerCevap(String cevap){
    var jsonVeri = json.decode(cevap);
    var yemeklerCevap = YemeklerCevap.fromJson(jsonVeri);
    return yemeklerCevap.yemekler;
  }

  Future<List<Yemekler>> tumYemekleriAl() async{
    //dio
    var url="http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var cevap = await Dio().get(url);
    return parseYemeklerCevap(cevap.data.toString());
  }

  Future<List<Yemekler>> searchFoods(String aramaKelimesi) async{
    var url="http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var cevap = await Dio().get(url);
    return parseYemeklerCevap(cevap.data).where((element) => element.yemek_adi.toLowerCase().contains(aramaKelimesi.toLowerCase())).toList();

  }
}

