abstract class ColorsState{}

//Used when starting the app
class InitialColorsState extends ColorsState{}

//Used after touching the screen
class ChangedColorsState extends ColorsState{
  int red;
  int green;
  int blue;

  ChangedColorsState({required this.red, required this.green, required this.blue});
}

class ErrorColorState extends ColorsState{}