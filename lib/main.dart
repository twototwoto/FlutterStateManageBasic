import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Counter.dart';
import 'CounterDemoPage.dart';
import 'LearnProvider/Pages/LearnProviderPage.dart';
import 'TransferData/Pages/TransferData.dart';
import 'dart:async';
// 参考学习资料：
// https://flutter.cn/docs/development/data-and-backend/state-mgmt/intro
// https://medium.com/flutter-community/making-sense-all-of-those-flutter-providers-e842e18f45dd

// 写法 1 开始 ================================================================
void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: MyApp(),
    ),
  );
}

// 写法 1：
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}
// 笔者认为写法 1 算是 App State
// 写法 1 结束================================================================

// 写法 2 开始================================================================
// 写法 2
//void main() {
//  runApp(
//    /// Providers are above [MyApp] instead of inside it, so that tests
//    /// can use [MyApp] while mocking the providers
//    MyApp(),
//  );
//}
//
//// 写法 2
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      // 写法2：如下写法在无法跨页面同步状态
//      home: MultiProvider(
//        providers: [
//          ChangeNotifierProvider(create: (_) => Counter()),
//        ],
//        child: MyHomePage(),
//      ),
//    );
//  }
//}

// 笔者认为写法 2 算是 ephmeral(短时） State
// 写法 2 结束================================================================

int _currentCountValue = 0;
String _conveyData = '1. 属性正向传值';

class MyHomePage extends StatelessWidget {
  // 记录当前技术值 用_currentCountValue于传值场景
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 如果把注释部分打开会出现问题
//    return MultiProvider(
//            providers: [
//        ChangeNotifierProvider(create: (_) => Counter()),
//      ],
    return Scaffold(
      appBar: AppBar(
        title: const Text('传递数据（状态管理）'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Text(_conveyData),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context)
                    .push(
                  CupertinoPageRoute(
                    builder: (context) => QiTransferDataPage(
                      '计数值：$_currentCountValue',
                    ),
                  ),
                )
                    .then((value) {
                  // 如果是 StatefulWidget 就可以在这里调用 setState 刷新界面
                  // setState() {_conveyData = value;}
                  showAboutDialog(
                      context: context,
                      applicationName: '学习Flutter',
                      applicationVersion: '0.01',
                      children: [
                        Text('从上一个页面回传的数据为："$value"'),
                      ]);
                  print('返回值：$value');
                });
              },
            ),
            Divider(),
            ListTile(
              title: Text('2. CounterPageDemo'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => CounterDemoPage(),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text('3. LearnProviderPageDemo'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => QiLearnProviderPage(),
                  ),
                );
              },
            ),
            Divider(),
            // EventBus event_bus 1.1.1 https://pub.dev/packages/event_bus#-readme-tab-
            ListTile(
              title: Text('4. EventBus'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                //TODO:
//                Navigator.of(context).push(
//                  CupertinoPageRoute(
//                    builder: (context) => QiLearnProviderPage(),
//                  ),
//                );
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            const Text('You have pushed the button this many times:'),
            const Count(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<Counter>().increment();
          _currentCountValue = context.read<Counter>().count;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
//    );
  }
}
// 笔者遇到过的问题
//  * Ensure the Provider<Counter> is an ancestor to this MyHomePage Widget
//  * Provide types to Provider<Counter>
//  * Provide types to Consumer<Counter>
//  * Provide types to Provider.of<Counter>()
// 把 ChangeNotifierProvider 放在什么位置：在需要访问它的 widget 之上。

class Count extends StatelessWidget {
  const Count({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

        /// Calls `context.watch` to make [MyHomePage] rebuild when [Counter] changes.
        '${context.watch<Counter>().count}',
        style: Theme.of(context).textTheme.headline2);
  }
}
