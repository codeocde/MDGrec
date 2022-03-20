import 'package:flutter/material.dart';

import 'package:shake/shake.dart';

class Home extends StatefulWidget {
  final Function? toggle;

  final Color? colorpick1;
  final Color? colorpick2;
  const Home({Key? key, this.toggle, this.colorpick1, this.colorpick2})
      : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color? color1 = Colors.blue;
  Color? color2 = Colors.red;
  Color? temp = Colors.amber;

  void colorChange() {
    setState(() {
      temp = color1;
      color1 = color2;
      color2 = temp;
    });
  }

  @override
  void initState() {
    super.initState();

    ShakeDetector.autoStart(onPhoneShake: () {
      colorChange();
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text("switch it up"),
        actions: [
          IconButton(
              onPressed: () {
                widget.toggle!();
              },
              icon: const Icon(Icons.color_lens)),
          IconButton(
              onPressed: () {
                setState(() {
                  color1 = widget.colorpick1;
                  color2 = widget.colorpick2;
                });
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(92.0),
          color: color1,
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(92.0),
          color: color2,
        )
      ]),
    ));
  }
}
