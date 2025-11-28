abstract class Event_calculator{}

class Event_calculator_penjumlahan extends Event_calculator{
  final int input;
  Event_calculator_penjumlahan(this.input);
}

class Event_calculator_pengurangan extends Event_calculator{
  final int input;
  Event_calculator_pengurangan(this.input);
}

class Event_calculator_perkalian extends Event_calculator{
  final int input;
  Event_calculator_perkalian(this.input);
}