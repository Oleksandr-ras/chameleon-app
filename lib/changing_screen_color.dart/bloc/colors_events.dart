abstract class ColorsEvent{}

//Sends when user tap on the screen
class TapOnScreen extends ColorsEvent{
  int red;
  int green;
  int blue;

  TapOnScreen({required this.red, required this.green, required this.blue});
}