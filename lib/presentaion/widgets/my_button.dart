import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final bool darkMode;
  final bool threeDOn;
  final double width;
  final double height;
  final double borderRadiusOfButton;
  final Function() function;
  final Widget myWidget;

  const MyButton(
      {super.key,
      required this.darkMode,
      required this.threeDOn,
      required this.width,
      required this.height,
      required this.borderRadiusOfButton,
      required this.function,
      required this.myWidget});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: darkMode ? Colors.grey[850] : Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(borderRadiusOfButton)),
          boxShadow: [
            BoxShadow(
              color: darkMode ? Colors.grey[900]! : Colors.grey[500]!,
              offset: Offset(4.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: darkMode ? Colors.grey[800]! : Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
          ],
          gradient: threeDOn
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.grey[200]!,
                    Colors.grey[300]!,
                    Colors.grey[400]!,
                    Colors.grey[500]!,
                  ],
                  stops: const [0.1, 0.3, 0.8, 0.9],
                )
              : null,
        ),
        child: Center(child: myWidget),
      ),
    );
  }
}

// Icon(
//           Icons.android,
//           size: 80,
//           color: darkMode ? Colors.white : Colors.black,
//         ),
