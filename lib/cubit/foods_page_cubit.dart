import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/repo/yemeklerdao_repository.dart';
import '../entity/yemekler.dart';

class FoodsPageCubit extends Cubit<List<Yemekler>>{

  FoodsPageCubit():super(<Yemekler>[]);

  var yrepo = YemeklerDaoRepository();

  Future<void> yemekleriGetir() async{
    var liste = await yrepo.tumYemekleriAl();
    emit(liste);
  }
}