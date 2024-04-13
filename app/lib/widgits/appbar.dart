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
          color: Colors.white,
        ),
        Text(
          "Shopink",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        Icon(
          Icons.notifications,
          color: Colors.white,
        )
      ],
    );
  }
}
