import 'package:flutter/cupertino.dart';

class DrawerProvider with ChangeNotifier {
  String filePath = '';
  List<String> filesL = [];
  int scale = 5;

  void setFilePath(String file) {
    filePath = file;
    notifyListeners();
  }

  void setScale(double value) {
    scale = value.floor();
    print(scale);
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