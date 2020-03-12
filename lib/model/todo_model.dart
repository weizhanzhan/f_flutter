import 'package:flutter/material.dart';

class TodoListModel with ChangeNotifier {
  String addName ;
  List nameArr;
  TodoListModel(String name,List arr){
    addName = name;
    nameArr = arr;
  }
  change(String name){
    addName = name;
    nameArr.add(name);
    notifyListeners();
  }
  remove(int i ){
    nameArr.removeAt(i);
    notifyListeners();
  }
  clear(){
    addName = '';
    nameArr = [];
  }
}
