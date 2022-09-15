class SepetYemekler{
  String sepet_yemek_id;
  String yemek_adi;
  String yemek_resim_adi;
  String yemek_fiyat;
  String yemek_siparis_adet;
  String kullanici_adi;

  SepetYemekler(
      {
        required this.sepet_yemek_id,
        required this.yemek_adi,
        required this.yemek_resim_adi,
        required this.yemek_fiyat,
        required this.yemek_siparis_adet,
        required this.kullanici_adi
      });
  factory SepetYemekler.fromJson(Map<String,dynamic> json){
    return SepetYemekler(
        sepet_yemek_id: json["sepet_yemek_id"] as String,
        yemek_adi: json["yemek_adi"] as String,
        yemek_resim_adi: json["yemek_resim_adi"] as String,
        yemek_fiyat: json["yemek_fiyat"] as String,
        yemek_siparis_adet: json["yemek_siparis_adet"] as String,
        kullanici_adi: json["kullanici_adi"] as String);
  }
}