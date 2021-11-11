import 'dart:math';

import 'package:color_changer/screen_changes/bloc/colors_bloc.dart';
import 'package:color_changer/screen_changes/bloc/colors_events.dart';
import 'package:color_changer/screen_changes/bloc/colors_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenFunctionality extends StatelessWidget {
  ScreenFunctionality({
    Key? key,
    required this.red,
    required this.green,
    required this.blue,
  }) : super(key: key);
  
  //Color parameters
  final int red;
  final int green;
  final int blue;

  //Apllication text
  static const String appName = 'Chameleon app';
  final String greeting = 'Hey there';

  //Aplication text style
  final TextStyle textDecoration = GoogleFonts.spartan(
      textStyle: const TextStyle(color: Colors.grey, fontSize: 40));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorsBloc, ColorsState>(builder: (context, state) {
      if (state is InitialColorsState) {
        return InitializeScreen(
          red: red,
          green: green,
          blue: blue,
          greeting: greeting,
          appName: appName,
          textDecoration: textDecoration,
        );
      }
      if (state is ChangedColorsState) {
        //Changed color
        return GestureDetector(
            onTap: () {
              BlocProvider.of<ColorsBloc>(context).add(
                TapOnScreen(
                    red: Random().nextInt(255),
                    green: Random().nextInt(255),
                    blue: Random().nextInt(255)),
              );
            },
            child: Scaffold(
              backgroundColor:
                  Color.fromRGBO(state.red, state.green, state.blue, 1),
              appBar: AppBar(
                title: const Text(appName),
              ),
              body: Center(child: Text(greeting, style: textDecoration)),
            ));
      }
      if (state is ErrorColorState) {
        return ExceptionScreen(
          appName: appName,
          textDecoration: textDecoration,
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: const Text(appName),
        ),
        body: Center(
          child: Text(
            'Welcome to chameleon app',
            style: textDecoration,
          ),
        ),
      );
    });
  }
}

//Exception
class ExceptionScreen extends StatelessWidget {
  const ExceptionScreen({
    Key? key,
    required this.appName,
    this.textDecoration,
  }) : super(key: key);

  final String appName;
  final TextStyle? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appName),
        ),
        body: const Center(
          child: Text('App is failed'),
        ));
  }
}

//Initialize color
class InitializeScreen extends StatelessWidget {
  const InitializeScreen({
    Key? key,
    required this.red,
    required this.green,
    required this.blue,
    required this.greeting,
    required this.appName,
    this.textDecoration,
  }) : super(key: key);

  final int red;
  final int green;
  final int blue;

  final String greeting;
  final String appName;

  final TextStyle? textDecoration;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          BlocProvider.of<ColorsBloc>(context).add(
            TapOnScreen(
                red: Random().nextInt(255),
                green: Random().nextInt(255),
                blue: Random().nextInt(255)),
          );
        },
        child: Scaffold(
            backgroundColor: Color.fromRGBO(red, green, blue, 1),
            appBar: AppBar(
              title: Text(appName),
            ),
            body: Center(child: Text('App Started', style: textDecoration))));
  }
}
