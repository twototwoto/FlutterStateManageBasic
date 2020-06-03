import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/QiLearnProviderModel.dart';
import 'FutureProvider.dart';
import 'ChangeNotifierProviderPage.dart';

class QiLearnProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider Consumer 使用
    return ChangeNotifierProvider<QiLearnProviderModel>(
      create: (context) => QiLearnProviderModel('待学习'),
      child: _QiLearnPage(),
    );
  }
}

// Provider Consumer 使用
class _QiLearnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChangeNotifierProvider'),
      ),
      body: Column(
        children: <Widget>[
          Consumer<QiLearnProviderModel>(builder: (context, model, child) {
            return RaisedButton(
              child: Text(model.learnStatus),
              onPressed: () {
                model.updateLearnStatus();
              },
            );
          }),
          Consumer<QiLearnProviderModel>(builder: (context, model, child) {
            return Text(model.learnStatus);
          }),
          RaisedButton(
            child: Text('FutureProvider'),
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => QiFutureProviderPage()));
            },
          ),
          RaisedButton(
            child: Text('FutureProvider'),
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => QiChangeNotifierProviderPage()));
            },
          ),
        ],
      ),
    );
  }
}
