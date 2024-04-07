import 'dart:convert';

import 'package:app/model/products.dart';
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
            const Row(
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
            ),
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
                        color: Colors.white,
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
                maxHeight: height * 0.25,
              ),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return Card(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Products.products.isEmpty
                              ? const Center(child: CircularProgressIndicator())
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    Products.products[i].image,
                                    width: width * 0.4,
                                  ),
                                ),
                          Text(
                            Products.products[i].name,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    );
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
                maxHeight: height * 0.25,
              ),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return Card(
                        color: Colors.grey,
                        child: Stack(
                          children: [
                            SizedBox(
                              width: width * 0.45,
                            ),
                            Products.products.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      Products.products[i + 10].image,
                                    ),
                                  ),
                          ],
                        ));
                  }),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.amber[500]),
          height: height * 0.06,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.home_filled,
              ),
              Icon(
                Icons.shopping_bag_outlined,
              ),
              Icon(
                Icons.thumb_up_outlined,
              ),
              Icon(
                Icons.person_3_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
