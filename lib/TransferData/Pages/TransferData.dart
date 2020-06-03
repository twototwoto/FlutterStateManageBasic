import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QiTransferDataPage extends StatelessWidget {
  final String transferString;

  QiTransferDataPage(this.transferString) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pop('导航返回到上一个界面的值');
          },
        ),
        title: Text(transferString),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        child: Text('Pop'),
        onPressed: () {
          Navigator.of(context).pop('返回到上一个界面的值');
        },
      ),
    );
  }
}
