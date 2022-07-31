import 'package:flutter/material.dart';
import 'dart:math';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'LOTTERY CLOVER'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String sorted = 'PRESS THE LUCK BUTTON!';
  int rand() {
    int number = 0;
    var rng = Random();
    number = rng.nextInt(61);
    if (number == 0) {
      number = 1;
    }
    return number;
  }

  List<int> add() {
    List<int> values = [];
    int num = rand();
    while (values.length < 6) {
      num = rand();
      values.contains(num) ? num = rand() : values.add(num);
    }
    values.sort();
    return values;
  }

  void _incrementCounter() {
    List<int> el = add();
    List<String> list = el.map((e) => e.toString()).toList();
    sorted = list.toString();
    setState(() {
      sorted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/clover.png',
                  width: 150, height: 150, fit: BoxFit.fill),
              // Image.network(
              //   'url',
              // ),
              const Text(
                'Your lucky numbers:',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                '$sorted',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                onPressed: _incrementCounter,
                child: const Icon(Icons.attach_money_sharp),
              ),
            ],
          ),
        ));
  }
}

int rand() {
  int number = 0;
  var rng = Random();
  number = rng.nextInt(61);
  if (number == 0) {
    number = 1;
  }
  return number;
}

List<int> add() {
  List<int> values = [];
  int num = rand();
  while (values.length < 6) {
    num = rand();
    values.contains(num) ? num = rand() : values.add(num);
  }
  return values;
}
