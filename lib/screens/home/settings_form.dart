import 'package:flutter/material.dart';
import 'package:flutter_firebase/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<int> chilies = [0, 1, 2, 3, 4, 5];

  String _currentName = '';
  int _currentChilies = 0;
  int _currentSpicyLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update your seblak settings.',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val!.isEmpty ? 'Please enter a name.' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 10.0),
          DropdownButtonFormField(
            value: _currentChilies,
            decoration: textInputDecoration,
            items: chilies.map((chilies) {
              return DropdownMenuItem(
                value: chilies,
                child: Text('$chilies chilies'),
              );
            }).toList(),
            onChanged: (int? val) => setState(() => _currentChilies = val!),
          ),
          SizedBox(height: 10.0),
          Slider(
            value: _currentSpicyLevel.toDouble(),
            activeColor: Colors.pink[_currentSpicyLevel > 0
                ? _currentSpicyLevel + (100 - _currentSpicyLevel % 100)
                : 100],
            inactiveColor: Colors.pink[_currentSpicyLevel > 0
                ? _currentSpicyLevel + (100 - _currentSpicyLevel % 100)
                : 100],
            min: 0,
            max: 600,
            divisions: 5,
            onChanged: (val) =>
                setState(() => _currentSpicyLevel = val.round()),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.pink[400]),
              onPressed: () async {
                print(_currentName);
                print(_currentChilies);
                print(_currentSpicyLevel);
              }),
        ],
      ),
    );
  }
}
