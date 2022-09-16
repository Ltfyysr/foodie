import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/entity/sepet_yemekler.dart';
import 'package:foodie/entity/yemekler.dart';
import 'package:foodie/repo/sepetyemeklerdao_repository.dart';

class CartPageCubit extends Cubit<List<SepetYemekler>>{
  CartPageCubit():super(<SepetYemekler>[]);
  var srepo = SepetYemeklerDaoRepository();

  Future<void> addToSepetWithoutCheck(
      Yemekler yemek,String kullanici_adi, int yemek_siparis_adet) async {
    await srepo.addToSepetWithoutCheck(yemek,kullanici_adi, yemek_siparis_adet);
  }
  /*Future<void> add(Yemekler yemek,int yemek_siparis_adet) async{
   await srepo.addToSepet(yemek, yemek_siparis_adet);
  }*/

  Future<void> sepettekileriGetir() async {
    var liste = await srepo.getBasket();
    emit(liste);
  }

}
