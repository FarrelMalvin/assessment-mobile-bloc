abstract class State_calculator{}

class State_calculator_initial extends State_calculator{
  final int number;
  State_calculator_initial(this.number);
}

class State_calculator_update extends State_calculator{
  final int number;
  State_calculator_update(this.number);
}