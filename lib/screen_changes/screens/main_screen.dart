import 'package:color_changer/screen_changes/bloc/colors_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen_func.dart';
import '../bloc/colors_states.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //Random color selection
  int red = Random().nextInt(255) + 1;

  int green = Random().nextInt(255) + 1;

  int blue = Random().nextInt(255) + 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ColorsBloc>(
        create: (context) => ColorsBloc(InitialColorsState()),
        child: ScreenFunctionality(red: red, green: green, blue: blue));
  }
}
