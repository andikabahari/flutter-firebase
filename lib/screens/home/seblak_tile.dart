import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/seblak.dart';

class SeblakTile extends StatelessWidget {
  final Seblak seblak;

  const SeblakTile({Key? key, required this.seblak}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.red[seblak.spicyLevel],
          ),
          title: Text(seblak.name),
          subtitle: Text('Takes ${seblak.chilies} chilies.'),
        ),
      ),
    );
  }
}
