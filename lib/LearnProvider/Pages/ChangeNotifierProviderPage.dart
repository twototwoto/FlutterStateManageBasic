import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/QiLearnProviderModel.dart';
import 'FutureProvider.dart';

class QiChangeNotifierProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider Consumer 使用
    return ChangeNotifierProvider<QiLearnProviderModel2>(
      create: (context) => QiLearnProviderModel2('待学习'),
      child: _QiChangeNotifierProviderPage(),
    );
  }
}

// Provider Consumer 使用
class _QiChangeNotifierProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChangeNotifierProvider'),
      ),
      body: Column(
        children: <Widget>[
          Consumer<QiLearnProviderModel2>(builder: (context, model, child) {
            return RaisedButton(
              child: Text(model.learnStatus),
              onPressed: () async {
                model.updateLearnStatus();
              },
            );
          }),
          Consumer<QiLearnProviderModel2>(builder: (context, model, child) {
            return Text(model.learnStatus);
          }),
        ],
      ),
    );
  }
}
