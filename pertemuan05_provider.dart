import 'package:flutter/material.dart';

class Pertemuan05Provider extends ChangeNotifier {
  // status sekolah telah dipelajari saat

  //inisialisasi nilai awal
  bool _diSekolah = false;
  bool _diPraktik = true;
  bool _diKursus = false;

  //ini akan return dari sekolah, di praktik, mengguanakan konsep OOP setter || getter
  bool get statusSekolah => _diSekolah;
  bool get statusPraktik => _diPraktik;
  bool get statusKursus => _diKursus;

  //perubahan state, menggunakan konsep listen stateManajemen
  set setSekolah(val) {
    _diSekolah = val;
    notifyListeners();
  }

  set setPraktik(val) {
    _diPraktik = val;
    notifyListeners();
  }

  set setKursus(val) {
    _diKursus = val;
    notifyListeners();
  }

  //Exercise
  //Perminatan sekolah
  bool _disekolahTkj = false;
  bool _disekolahRpl = true;
  bool _disekolahSma = false;

  //callback using prov from final prov.statusjurusanTkj
  bool get statusjurusanTkj => _disekolahTkj;
  bool get statusjurusanRpl => _disekolahRpl;
  bool get statusjurusanSma => _disekolahSma;

  set setTkj(val) {
    _disekolahTkj = val;
    notifyListeners();
  }

  set setRpl(val) {
    _disekolahRpl = val;
    notifyListeners();
  }

  set setSma(val) {
    _disekolahSma = val;
    notifyListeners();
  }
}
