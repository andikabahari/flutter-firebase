import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/item.dart';

class ItemTile extends StatelessWidget {
  final Item item;

  const ItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text(item.name),
          subtitle: Text('Available ${item.quantity}'),
        ),
      ),
    );
  }
}
