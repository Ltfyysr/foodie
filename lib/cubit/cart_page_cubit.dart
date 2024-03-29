import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/entity/sepet_yemekler.dart';
import 'package:foodie/entity/yemekler.dart';
import 'package:foodie/repo/sepetyemeklerdao_repository.dart';

class CartPageCubit extends Cubit<List<SepetYemekler>>{
  CartPageCubit():super([]);
  var srepo = SepetYemeklerDaoRepository();

  Future<void> add(
      Yemekler yemek,String kullanici_adi, int yemek_siparis_adet) async {
    await srepo.addToSepet(yemek,kullanici_adi, yemek_siparis_adet);
  }

  Future<void> get(String kullanici_adi) async {
    var liste = await srepo.getBasket(kullanici_adi);
      emit(liste);
  }
  Future<void> delete(String sepet_yemek_id,String kullanici_adi) async{
    var liste = await srepo.deleteFoods(sepet_yemek_id, kullanici_adi);
    await get(kullanici_adi);

  }
}
