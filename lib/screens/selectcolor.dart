import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

class Colorselect extends StatefulWidget {
  final Function? toggle;
  final Function? colorsaction;
  const Colorselect({Key? key, this.toggle, this.colorsaction})
      : super(key: key);
  @override
  State<Colorselect> createState() => _ColorselectState();
}

class _ColorselectState extends State<Colorselect> {
  Color color1 = Colors.blue;
  Color color2 = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('switch it up'),
        actions: [
          TextButton(
              onPressed: () {
                widget.toggle!();
              },
              child: const Text(
                "Back",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: color1,
                  height: 300,
                  width: 193,
                  child: const Center(),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Container(
                  height: 300,
                  width: 193,
                  color: color2,
                  child: const Center(),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            FittedBox(
              child: Column(children: [
                Row(
                  children: [
                    CircleColorPicker(
                      size: const Size(250, 250),
                      onChanged: (Color color) {
                        setState(() {
                          color1 = color;
                        });
                      },
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                    CircleColorPicker(
                      size: const Size(250, 250),
                      onChanged: (Color color) {
                        setState(() {
                          color2 = color;
                        });
                      },
                      colorCodeBuilder: (context, color) {
                        return Text(
                          'RGB(${color.red},${color.green},${color.blue})',
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.black45,
                  child: TextButton(
                      onPressed: () {
                        widget.colorsaction!(color1, color2);
                        widget.toggle!();
                      },
                      child: const Text(
                        "Apply Chaanges",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
