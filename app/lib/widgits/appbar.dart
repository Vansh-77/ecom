import 'package:flutter/material.dart';

class App_bar extends StatelessWidget {
  const App_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.menu,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Text(
            "Shopink",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Icon(
          Icons.notifications,
        )
      ],
    );
  }
}
