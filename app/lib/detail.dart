import 'dart:convert';

import 'package:app/cartpage.dart';
import 'package:app/model/products.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart";

class Detailpage extends StatefulWidget {
  final prod item;
  const Detailpage({super.key, required this.item});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

int count = 1;

class _DetailpageState extends State<Detailpage> {
  void add_to_cart() async {
    var url = Uri.http("192.168.1.8", "add_to_cart");
    var body =
        jsonEncode({"user_id": 1, "product_id": widget.item.id, "quantity": 1});
    var response = await post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
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
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Cart()));
                  },
                  child: const Icon(
                    Icons.shopping_bag,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Image.network(
              widget.item.image,
              height: height * 0.35,
              width: width,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * 0.6,
                        child: Flex(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          direction: Axis.vertical,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 18.0, top: 18),
                              child: Text(
                                widget.item.name,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18),
                              child: Text(
                                "\$${widget.item.price}",
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 30),
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color.fromARGB(255, 209, 204, 204)),
                        child: const Icon(Icons.thumb_up_alt_outlined),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      widget.item.desc,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              height: 37,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 201, 201, 201),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (count != 1) {
                          count--;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      width: 35,
                      height: 35,
                      child: const Center(
                          child: Text(
                        "-",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      )),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        "$count",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (count != 50) {
                          count++;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      width: 35,
                      height: 35,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                add_to_cart();
              },
              child: Container(
                margin: const EdgeInsets.only(right: 28),
                height: 45,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(45),
                ),
                child: const Center(
                    child: Text(
                  "Add To Cart",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
