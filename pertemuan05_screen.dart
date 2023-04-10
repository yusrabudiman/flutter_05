import 'package:flutter/material.dart';
import 'package:flutter_application_5/pertemuan05/pertemuan05_provider.dart';
import 'package:provider/provider.dart';

class Pertemuan05Screen extends StatefulWidget {
  const Pertemuan05Screen({super.key});

  @override
  State<Pertemuan05Screen> createState() => _Pertemuan05ScreenState();
}

class _Pertemuan05ScreenState extends State<Pertemuan05Screen> {
  //status soal1
  bool? soal1a = false;
  bool? soal1b = false;

  //soal 2
  String soal2 = 'answ';

  //pilih kelas
  bool kelasPagi = false;
  bool kelasSiang = false;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan05Provider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('M05 Title checkbox'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //soal menggunakan checkbox
              const Text(
                  '1. Memori yang berfungsi untuk tempat penyimpanan data sementara disebut..'),
              Row(
                children: [
                  Text('a.'),
                  SizedBox(width: 5),
                  Checkbox(
                    value: soal1a,
                    onChanged: (val) {
                      setState(() {
                        soal1a = val;
                      });
                    },
                  ),
                  Text('RAM'),
                ],
              ),
              Row(
                children: [
                  Text('b.'),
                  SizedBox(width: 5),
                  Checkbox(
                    value: soal1b,
                    onChanged: (val) {
                      setState(() {
                        soal1b = val;
                      });
                    },
                  ),
                  Text('Random Access Memory'),
                ],
              ),

              //respon jawaban soal 1
              if (soal1a == false && soal1b == false)
                Container()
              else if (soal1a == true && soal1b == true)
                const Text(
                  'Benar!',
                  style: TextStyle(color: Colors.green),
                )
              else
                const Text(
                  'Jawaban Masih salah, coba lagi',
                  style: TextStyle(color: Colors.red),
                ),

              const Divider(),
              //soal 2 checkbox
              const Text('2.Skema desain pengembangan jaringan disebut..'),
              Row(
                children: [
                  Text('a.'),
                  SizedBox(width: 5),
                  Radio(
                    value: 'topologi',
                    groupValue: soal2,
                    onChanged: (val) {
                      setState(() {
                        soal2 = 'topologi';
                      });
                    },
                  ),
                  Text('Topologi'),
                ],
              ),
              Row(
                children: [
                  Text('b.'),
                  SizedBox(width: 5),
                  Radio(
                    value: 'desain jaringan',
                    groupValue: soal2,
                    onChanged: (val) {
                      setState(() {
                        soal2 = 'desain jaringan';
                      });
                    },
                  ),
                  Text('Desain Jaringan'),
                ],
              ),
              //cek jawaban
              if (soal2 == 'answ')
                Container()
              else if (soal2 == 'topologi')
                const Text(
                  'benar!',
                  style: TextStyle(color: Colors.green),
                )
              else
                const Text(
                  'Jawaban masih salah, coba lagi',
                  style: TextStyle(color: Colors.red),
                ),

              //Choice Chip
              const Divider(),
              const Text(
                'Feedback soal',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('Kelas'),
              Row(
                children: [
                  ChoiceChip(
                    label: Text('Pagi'),
                    selected: kelasPagi,
                    selectedColor: Colors.blue[200],
                    onSelected: (val) {
                      setState(() {
                        if (val) {
                          kelasPagi = val;
                          kelasSiang = !val;
                        } else {
                          kelasPagi = false;
                          kelasSiang = false;
                        }
                      });
                    },
                  ),
                  const SizedBox(width: 5),
                  ChoiceChip(
                    label: Text('Siang'),
                    selected: kelasSiang,
                    selectedColor: Colors.blue[200],
                    onSelected: (val) {
                      setState(() {
                        if (val) {
                          kelasSiang = val;
                          kelasPagi = !val;
                        } else {
                          kelasPagi = false;
                          kelasSiang = false;
                        }
                      });
                    },
                  )
                ],
              ),
              const Text('Soal di atas telah di pelajari saat ?..'),
              Row(
                children: [
                  FilterChip(
                    label: Text('Sekolah'),
                    selectedColor: Colors.blue[200],
                    selected: prov.statusSekolah,
                    onSelected: (val) {
                      prov.setSekolah = val;
                    },
                  ),
                  const SizedBox(width: 5),
                  FilterChip(
                    label: Text('Praktikum'),
                    selectedColor: Colors.blue[200],
                    selected: prov.statusPraktik,
                    onSelected: (val) {
                      prov.setPraktik = val;
                    },
                  ),
                  const SizedBox(width: 5),
                  FilterChip(
                    label: Text('Kursus'),
                    selectedColor: Colors.blue[200],
                    selected: prov.statusKursus,
                    onSelected: (val) {
                      prov.setKursus = val;
                    },
                  ),
                ],
              ),

              //InputChips
              const Text('Perminatan saat sekolah?'),
              Consumer<Pertemuan05Provider>(
                builder: (context, prov, child) {
                  List<Widget> InputChips = [];

                  if (prov.statusjurusanTkj) {
                    InputChips.add(Chip(
                      label: Text('TKJ'),
                      backgroundColor: Colors.blue,
                    ));
                  } else if (prov.statusjurusanRpl) {
                    InputChips.add(Chip(
                      label: Text('RPL'),
                      backgroundColor: Colors.blue,
                    ));
                  } else if (prov.statusjurusanSma) {
                    InputChips.add(Chip(
                      label: Text('SMA'),
                      backgroundColor: Colors.blue,
                    ));
                  }

                  return Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Row(
                          children: [...InputChips],
                        ),
                      )
                    ],
                  );
                },
              ),
              Row(
                children: [
                  InputChip(
                    label: Text('TKJ'),
                    selected: prov.statusjurusanTkj,
                    selectedColor: Colors.blue[200],
                    onSelected: (val) {
                      setState(() {
                        if (val) {
                          prov.setTkj = val;
                          prov.setRpl = !val;
                          prov.setSma = !val;
                        } else {
                          prov.setTkj = false;
                          prov.setRpl = false;
                          prov.setSma = false;
                        }
                      });
                    },
                  ),
                  SizedBox(width: 5),
                  InputChip(
                    label: Text('RPL'),
                    selected: prov.statusjurusanRpl,
                    selectedColor: Colors.blue[200],
                    onSelected: (val) {
                      setState(() {
                        if (val) {
                          prov.setTkj = !val;
                          prov.setRpl = val;
                          prov.setSma = !val;
                        } else {
                          prov.setTkj = false;
                          prov.setRpl = false;
                          prov.setSma = false;
                        }
                      });
                    },
                  ),
                  SizedBox(width: 5),
                  InputChip(
                    label: Text('SMA'),
                    selected: prov.statusjurusanSma,
                    selectedColor: Colors.blue[200],
                    onSelected: (val) {
                      setState(() {
                        if (val) {
                          prov.setTkj = !val;
                          prov.setRpl = !val;
                          prov.setSma = val;
                        } else {
                          prov.setTkj = false;
                          prov.setRpl = false;
                          prov.setSma = false;
                        }
                      });
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
