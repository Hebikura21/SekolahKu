import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedValue = 1; // Nilai terpilih pada tombol radio

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contoh Tombol Radio Kustom',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contoh Tombol Radio Kustom'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as int;
                  });
                },
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedValue = 1;
                  });
                },
                child: Text(
                  'Pilihan 1',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(width: 16),
              Radio(
                value: 2,
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as int;
                  });
                },
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedValue = 2;
                  });
                },
                child: Text(
                  'Pilihan 2',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
