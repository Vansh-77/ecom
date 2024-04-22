import "dart:convert";
import "package:app/detail.dart";
import "package:app/model/cartmodel.dart";
import "package:app/widgits/itemwidgit.dart";
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  const Cart({super.key});
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    var url = Uri.http("192.168.1.8", "cart");
    var body = jsonEncode({"user_id": 1});
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    var data = response.body;
    print(data);
    var jsondata = jsonDecode(data);
    List<CartItem> items = getCart(jsondata["response"]);
    Items.items = items;
    setState(() {});
  }

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
                  child: const Icon(Icons.arrow_back),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.0),
                  child: Text(
                    "Cart",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(Icons.menu),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Items.items.isEmpty
                ? SizedBox(
                    height: height * 0.54,
                    child: const Center(
                        child: Text(
                      "Cart Empty",
                      style: TextStyle(fontSize: 30),
                    )),
                  )
                : Container(
                    padding: EdgeInsets.zero,
                    height: height * 0.54,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: Items.items.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Detailpage(item: Items.items[i].pd),
                                  ));
                            },
                            child: ItemWidgit(item: Items.items[i].pd),
                          );
                        }),
                  ),
            Container(
              height: 2,
              width: width,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
