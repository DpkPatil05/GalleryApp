import 'dart:io';

import 'package:flutter/cupertino.dart';

class DrawerProvider with ChangeNotifier {
  String filePath = '';
  List<String> filesL = [];

  void setFilePath(String file) {
    filePath = file;
    notifyListeners();
  }

  // Future<List<String>> _getFilesFromDir() async {
  //   File file = File(filePath);
  //   file.length();
  //   return await FilesInDirectory().getFilesFromDir();
  // }

  /*int getFilesCount(){
    // _getFilesFromDir();
    File file = File(filePath);
    int count = filesL.length;
    print("Count = " + file.lengthSync().toString());
    return count;
  }*/

}