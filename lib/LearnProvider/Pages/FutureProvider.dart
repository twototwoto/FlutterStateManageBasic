import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/QiLearnProviderModel.dart';

class QiFutureProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider Consumer 使用
    return FutureProvider<QiFutureLearnProviderModel>(
      initialData: QiFutureLearnProviderModel('initial value'),
      create: (context) => asyncFutureProviderModel(),
      child: _QiFutureProviderPage(),
    );
  }

  Future<QiFutureLearnProviderModel> asyncFutureProviderModel() async {
    await Future.delayed(Duration(seconds: 3));
    print('Async倒计时完毕');
    return QiFutureLearnProviderModel('网络数据');
  }
}

// Provider Consumer 使用
class _QiFutureProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureProvider'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Consumer<QiFutureLearnProviderModel>(
                builder: (context, model, child) {
              return RaisedButton(
                child: Text('点击后进行网络请求'),
                onPressed: () {
                  model.updateLearnStatus();
                },
              );
            }),
            Consumer<QiFutureLearnProviderModel>(
                builder: (context, model, child) {
              return Text(model.learnStatus);
            }),
          ],
        ),
      ),
    );
  }
}
