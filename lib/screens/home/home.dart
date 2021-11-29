import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/models/seblak.dart';
import 'package:flutter_firebase/services/auth.dart';
import 'package:flutter_firebase/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase/screens/home/seblak_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: Text('bottom sheet'),
          );
        },
      );
    }

    return StreamProvider<List<Seblak>>.value(
      initialData: [],
      value: DatabaseService().seblaks,
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          title: Text('Seblak List'),
          backgroundColor: Colors.blueGrey[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              onPressed: () async => await _auth.signOut(),
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              label: Text(
                'Sign Out',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: _showSettingsPanel,
              icon: Icon(Icons.settings),
              label: Text('Settings'),
            ),
          ],
        ),
        body: SeblakList(),
      ),
    );
  }
}
