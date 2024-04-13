import 'dart:convert';
import 'package:app/widgits/appbar.dart';
import 'package:app/model/products.dart';
import 'package:app/widgits/card.dart';
import 'package:app/widgits/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var data = await rootBundle.loadString("data.json");
    List<dynamic> jsons = jsonDecode(data);
    List<prod> products = getproducts(jsons);
    Products.products = products;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color.fromARGB(255, 2, 200, 255);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(2, 2, 45, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            const App_bar(),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                    constraints: BoxConstraints(
                        maxWidth: width * 0.90, maxHeight: width * 0.40),
                    decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        " Get your \n special sale\n up to 50%",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "Shop now",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Arrival",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "see all",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: width * 0.04),
              constraints: BoxConstraints(
                maxHeight: height * 0.3,
              ),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return Cardview(i: i);
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best sellers",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "see all",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: width * 0.04),
              constraints: BoxConstraints(
                maxHeight: height * 0.3,
              ),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return Cardview(i: i + 10);
                  }),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      bottomNavigationBar: const Navigation_bar(),
    );
  }
}
