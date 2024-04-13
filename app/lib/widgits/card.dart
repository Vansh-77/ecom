import 'package:flutter/material.dart';
import 'package:app/model/products.dart';

class Cardview extends StatefulWidget {
  final int i;
  const Cardview({super.key, required this.i});
  @override
  State<Cardview> createState() => _CardviewState();
}

class _CardviewState extends State<Cardview> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int i = widget.i;
    return Card(
      color: Colors.white,
      child: Products.products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    Products.products[i].image,
                    width: width * 0.5,
                    height: height * 0.17,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  width: width * 0.45,
                  height: height * 0.05,
                  child: Text(
                    Products.products[i].name,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.45,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Text(
                          "\$${Products.products[i].price}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Icon(Icons.thumb_up_outlined)
                    ],
                  ),
                ),
              ],
            ),
    );
    ;
  }
}
