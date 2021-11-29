import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/seblak.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase/screens/home/seblak_tile.dart';

class SeblakList extends StatefulWidget {
  const SeblakList({Key? key}) : super(key: key);

  @override
  _SeblakListState createState() => _SeblakListState();
}

class _SeblakListState extends State<SeblakList> {
  @override
  Widget build(BuildContext context) {
    final seblaks = Provider.of<List<Seblak>>(context);

    return ListView.builder(
      itemCount: seblaks.length,
      itemBuilder: (context, index) {
        return SeblakTile(seblak: seblaks[index]);
      },
    );
  }
}
