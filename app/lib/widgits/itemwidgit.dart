import 'package:app/model/products.dart';
import 'package:flutter/material.dart';

class ItemWidgit extends StatefulWidget {
  final prod item;

  const ItemWidgit({super.key, required this.item});

  @override
  State<ItemWidgit> createState() => _ItemWidgitState();
}

int count = 1;

class _ItemWidgitState extends State<ItemWidgit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey,
            width: 0.2,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset.zero,
              blurRadius: 0.5,
            )
          ]),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            width: 100,
            child: Image.network(
              widget.item.image,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 10, right: 2),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.item.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${widget.item.price}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        // Container(
                        //     width: 60,
                        //     padding: EdgeInsets.zero,
                        //     decoration: BoxDecoration(
                        //       color: const Color.fromARGB(255, 0, 19, 52),
                        //       borderRadius: BorderRadius.circular(50),
                        //       boxShadow: const [
                        //         BoxShadow(
                        //           color: Colors.black,
                        //           offset: Offset.zero,
                        //           blurRadius: 1,
                        //         )
                        //       ],
                        //     ),
                        //     child: const Center(
                        //       child: Padding(
                        //         padding: EdgeInsets.all(5.0),
                        //         child: Text(" Buy ",
                        //             style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontWeight: FontWeight.w500,
                        //                 fontSize: 16)),
                        //       ),
                        //     ))
                        Row(
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
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                width: 35,
                                height: 35,
                                child: const Center(
                                    child: Text(
                                  "-",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
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
                                    border: Border.all(
                                        color: Colors.black, width: 1),
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
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ]),
    );
  }
}
