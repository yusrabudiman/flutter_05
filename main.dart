import 'package:flutter/material.dart';
import 'package:flutter_application_5/pertemuan05/pertemuan05_screen.dart';
import 'package:flutter_application_5/pertemuan05/pertemuan05_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //tambahkan provider disini

        ChangeNotifierProvider(create: (_) => Pertemuan05Provider()),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        home: Pertemuan05Screen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
