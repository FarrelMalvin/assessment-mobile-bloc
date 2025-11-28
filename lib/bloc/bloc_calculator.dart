import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/State_calculator.dart';
import '../event/Event_calculator.dart';

class Bloc_calculator extends Bloc<Event_calculator, State_calculator>{
  int number = 0;
  
  Bloc_calculator():super(State_calculator_initial(0)){
    on<Event_calculator_penjumlahan>(onPenjumlahan);
    on<Event_calculator_pengurangan>(onPengurangan);
    on<Event_calculator_perkalian>(onPerkalian);
  }
  
  void onPenjumlahan(Event_calculator_penjumlahan event, Emitter<State_calculator> emit){
    number = number + event.input;
    emit(State_calculator_update(number));
  }
  
  void onPengurangan(Event_calculator_pengurangan event, Emitter<State_calculator> emit){
    number = number - event.input;
    emit(State_calculator_update(number));
  }
  
  void onPerkalian(Event_calculator_perkalian event, Emitter<State_calculator> emit){
    number = number * event.input;
    emit(State_calculator_update(number));
  }
}