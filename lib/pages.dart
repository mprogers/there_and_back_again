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
    Navigator.pushNamed(context, '/BPage', arguments: 'One fish, two fish');
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
    Navigator.pop(context);
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
