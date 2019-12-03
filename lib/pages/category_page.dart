import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    print('category init');
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('category'),
    );
  }
}