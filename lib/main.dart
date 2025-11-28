import 'package:flutter/material.dart';
import 'package:flutter19/pages/halaman1.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc_calculator.dart';
import '../pages/increment_page.dart';
import '../pages/decrement_page.dart';
import '../pages/multiplication.dart';
void main(List<String> args){
  runApp(MyAPP());
}

class MyAPP extends StatelessWidget {
  const MyAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<Bloc_calculator>(
          create: (context) => Bloc_calculator(),
        ),
      ],
      child: MaterialApp(
        title: 'Latihan Flutter BLoC Calculator',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent)
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Halaman1(),
          '/penjumlahan': (context) => HalamanPenjumlahan(),
          '/pengurangan': (context) => HalamanPengurangan(),
          '/perkalian': (context) => HalamanPerkalian(),
        },
      )
    );
  }
}