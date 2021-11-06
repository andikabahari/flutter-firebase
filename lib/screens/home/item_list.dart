import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/item.dart';
import 'package:provider/provider.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<List<Item>>(context);
    items.forEach((item) {
      print(item.name);
      print(item.description);
      print(item.quantity);
    });

    return Container();
  }
}
