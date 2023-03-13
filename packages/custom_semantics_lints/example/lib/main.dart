import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          semanticsLabel: widget.title,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              semanticsLabel: widget.title,
            ),
            const Text(
              'You have pushed the button this many times:',
              semanticsLabel: '',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
              semanticsLabel: '$_counter',
            ),
            Semantics(
              button: true,
              enabled: true,
              label: "{}",
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Test',
                  semanticsLabel: 'Test',
                ),
              ),
            ),
            Semantics(
              textField: true,
              label: "FlutterLogo()",
              child: ElevatedButton(
                onPressed: () {},
                child: const FlutterLogo(),
              ),
            ),
            Semantics(
              button: true,
              enabled: true,
              label: "{}",
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ),
            Semantics(
              button: true,
              enabled: true,
              label: "{}",
              child: CustomSwitch(
                onChanged: (value) {},
                activeColor: Colors.white,
              ),
            ),
            Semantics(
              textField: true,
              label: "TextEditingController()",
              child: TextField(
                controller: TextEditingController(),
                maxLength: 100,
                decoration: const InputDecoration(
                  counterText: '',
                  hintText: '',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Semantics(
        button: true,
        enabled: true,
        label: "tooltip: 'Increment'",
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inActiveColor;

  const CustomSwitch({
    Key? key,
    this.value = false,
    required this.onChanged,
    this.activeColor = Colors.white,
    this.inActiveColor = Colors.black12,
  }) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  Alignment switchControlAlignment = Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
        width: 42.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            width: 2.0,
            color: widget.value ? widget.activeColor : widget.inActiveColor,
          ),
          color: widget.value ? widget.activeColor : Colors.white,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          alignment:
              widget.value ? Alignment.centerRight : Alignment.centerLeft,
          curve: Curves.decelerate,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              width: 14.0,
              height: 14.0,
              decoration: BoxDecoration(
                color: widget.value ? Colors.white : widget.inActiveColor,
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          widget.onChanged(!widget.value);
        });
      },
    );
  }
}
