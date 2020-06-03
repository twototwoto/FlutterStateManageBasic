import 'package:flutter/material.dart';
import 'Counter.dart';
import 'package:provider/provider.dart';

class CounterDemoPage extends StatelessWidget {
  const CounterDemoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('学习 Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),

            /// Extracted as a separate widget for performance optimization.
            /// As a separate widget, it will rebuild independently from [MyHomePage].
            ///
            /// This is totally optional (and rarely needed).
            /// Similarly, we could also use [Consumer] or [Selector].
            const Count(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

          /// Calls `context.read` instead of `context.watch` so that it does not rebuild
          /// when [Counter] changes.
          tooltip: 'Increment',
          child: const Icon(Icons.add),
          onPressed: () {
            context.read<Counter>().increment();
          }),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<Counter>().count}',
        style: Theme.of(context).textTheme.headline4);
  }
}
