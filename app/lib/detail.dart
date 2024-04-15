import 'package:app/model/products.dart';
import 'package:flutter/material.dart';

class Detailpage extends StatefulWidget {
  final prod item;
  const Detailpage({super.key, required this.item});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.0),
                  child: Text(
                    "Details",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.menu,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                widget.item.image,
                height: height * 0.35,
                width: width,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              width: width,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(100, 158, 158, 158),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  )),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      widget.item.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(18),
                    child: Text("\$${widget.item.price}"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
