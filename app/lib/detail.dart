import 'package:app/model/products.dart';
import 'package:app/widgits/appbar.dart';
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
    return const Scaffold(
      body: Column(
        children: [
          App_bar(),
        ],
      ),
    );
  }
}
