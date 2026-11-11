import 'package:flutter/material.dart';
import 'widgets/counter_display.dart';
import 'widgets/counter_buttons.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('Counter dimulai');
  }

  void _addCounter() {
    setState(() {
      _counter++;
    });
  }

  void _subtractCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  void dispose() {
    debugPrint('Counter ditutup');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Counter'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Nilai Counter Saat Ini',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              CounterDisplay(value: _counter),
              const SizedBox(height: 32),
              CounterButtons(
                onAdd: _addCounter,
                onSubtract: _subtractCounter,
                onReset: _resetCounter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
