import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// Counter value
  int _counterValue = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: CounterButton(
            loading: false,
            onChange: (int val) {
              setState(() {
                _counterValue = val;
              });
            },
            count: _counterValue,
            countColor: Colors.purple,
            buttonColor: Colors.purpleAccent,
            progressColor: Colors.purpleAccent,
          ),
        ),
      ),
    );
  }
}
