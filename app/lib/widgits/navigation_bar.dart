import 'package:app/cartpage.dart';
import 'package:flutter/material.dart';

class Navigation_bar extends StatelessWidget {
  const Navigation_bar({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.amber[500]),
        height: height * 0.06,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: const Icon(
                Icons.home_filled,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Cart(),
                    ));
              },
              child: const Icon(
                Icons.shopping_bag_outlined,
              ),
            ),
            GestureDetector(
              child: const Icon(
                Icons.thumb_up_outlined,
              ),
            ),
            GestureDetector(
              child: const Icon(
                Icons.person_3_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
