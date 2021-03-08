import 'package:flutter/material.dart';
import 'dart:math';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return APage();
  }
}

class APage extends StatefulWidget {
  @override
  _APageState createState() => _APageState();
}

class _APageState extends State<APage> {
  void _goToB({BuildContext context}) async {
    var result = await Navigator.pushNamed(context, '/BPage',
        arguments: 'One fish, two fish');
    SnackBar snackBar =
        SnackBar(content: Text(result), duration: Duration(milliseconds: 500));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('A Page')),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  _goToB(context: context);
                },
                child: Text('==> B'),
              )
            ]));
  }
}

class BPage extends StatefulWidget {
  @override
  _BPageState createState() => _BPageState();
}

class _BPageState extends State<BPage> {
  String message;
  void _goBack({BuildContext context}) {
    Navigator.pop(context, message);
  }

  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context).settings.arguments;
    print(args);
    return Scaffold(
        appBar: AppBar(title: Text('BPage')),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                  decoration: InputDecoration(labelText: 'Phrase'),
                  onChanged: (text) {
                    message = text;
                  }),
              ElevatedButton(
                onPressed: () {
                  _goBack(context: context);
                },
                child: Text('<==A'),
              )
            ]));
  }
}
