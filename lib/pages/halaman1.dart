import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc_calculator.dart';
import '../state/State_calculator.dart';

class Halaman1 extends StatelessWidget {
  const Halaman1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Bloc_calculator, State_calculator>(
      builder: (context, state) {
        int currentNumber = 0;
        if (state is State_calculator_initial) {
          currentNumber = state.number;
        } else if (state is State_calculator_update) {
          currentNumber = state.number;
        }
        
        return Scaffold(
          appBar: AppBar(
            title: Text("Menu Utama"),
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Angka Saat Ini:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    currentNumber.toString(),
                    style: TextStyle(fontSize: 56, fontWeight: FontWeight.bold, color: Colors.cyan),
                  ),
                  SizedBox(height: 50),
                  Text(
                    "Pilih Halaman:",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/penjumlahan');
                      },
                      child: Text("Halaman Penjumlahan"),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/pengurangan');
                      },
                      child: Text("Halaman Pengurangan"),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/perkalian');
                      },
                      child: Text("Halaman Perkalian"),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}