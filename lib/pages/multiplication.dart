
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc_calculator.dart';
import '../event/Event_calculator.dart';
import '../state/State_calculator.dart';

class HalamanPerkalian extends StatefulWidget {
  const HalamanPerkalian({super.key});

  @override
  State<HalamanPerkalian> createState() => _HalamanPerkalianState();
}

class _HalamanPerkalianState extends State<HalamanPerkalian> {
  final TextEditingController _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

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
            title: Text("Halaman Perkalian"),
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Angka Saat Ini:",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    currentNumber.toString(),
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40),
                  TextField(
                    controller: _inputController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Masukkan angka",
                      border: OutlineInputBorder(),
                      hintText: "Input angka untuk perkalian",
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final inputText = _inputController.text.trim();
                      if (inputText.isNotEmpty) {
                        try {
                          final input = int.parse(inputText);
                          context.read<Bloc_calculator>().add(
                            Event_calculator_perkalian(input)
                          );
                          _inputController.clear();
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Masukkan angka yang valid!")),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Masukkan angka terlebih dahulu!")),
                        );
                      }
                    },
                    child: Text("Kali"),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
