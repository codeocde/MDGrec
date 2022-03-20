import 'package:flutter/material.dart';
import 'package:mdgrecruitment/screens/homescreen.dart';
import 'package:mdgrecruitment/screens/selectcolor.dart';

class ScreenController extends StatefulWidget {
  const ScreenController({Key? key}) : super(key: key);

  @override
  State<ScreenController> createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  bool showhomescreen = true;
  Color gcolor1 = Colors.blue;
  Color gcolor2 = Colors.red;

  void toggle() {
    setState(() {
      showhomescreen = !showhomescreen;
    });
  }

  void colorget(Color color1, Color color2) {
    setState(
      () {
        gcolor1 = color1;
        gcolor2 = color2;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (showhomescreen == true) {
      return Home(
        toggle: toggle,
        colorpick1: gcolor1,
        colorpick2: gcolor2,
      );
    } else {
      return Colorselect(
        toggle: toggle,
        colorsaction: colorget,
      );
    }
  }
}
