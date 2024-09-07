import 'package:assignment/home_screen.dart';
import 'package:assignment/screen/product_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:ProductListScreen()
    );
  }
}
