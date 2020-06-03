import 'package:flutter/material.dart';

class QiLearnProviderModel with ChangeNotifier {
  final String value;
  QiLearnProviderModel(this.value);

  String learnStatus = '未学习';
  void updateLearnStatus() {
    learnStatus = value;
    notifyListeners();
  }
}

class QiLearnProviderModel2 with ChangeNotifier {
  final String value;
  QiLearnProviderModel2(this.value);

  String learnStatus = '未学习';
  Future<void> updateLearnStatus() async {
    print('到此 $value');
    await Future.delayed(Duration(seconds: 2));
    learnStatus = '返回的网络数据';
    print('网络请求结束');
    notifyListeners();
  }
}

// class QiFutureLearnProviderModel with ChangeNotifier {
class QiFutureLearnProviderModel with ChangeNotifier {
  final String value;
  QiFutureLearnProviderModel(this.value);

  String learnStatus = '未学习';
  Future<void> updateLearnStatus() async {
    print('到此 $value');
    await Future.delayed(Duration(seconds: 2));
    learnStatus = '返回的网络数据';
    print('网络请求结束');
    notifyListeners();
    // 然而这个并不会更新数据
    // notifyListeners();
  }
  // void updateLearnStatus() {
  //   learnStatus = value;
  //   notifyListeners();
  // }
}
