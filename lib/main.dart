import 'package:f_flutter/model/theme_model.dart';
import 'package:f_flutter/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './home_page.dart';
void main() => runApp(
  //ChangeNotifierProvider 继承于 ListenableProvider
  MultiProvider(
    providers: [
      // FutureProvider<String>(
      //   create: (_){
      //     return Future.delayed(Duration(seconds:2),() {
      //       return "吼吼吼，我变了";
      //     });
      //   },
      //   initialData: '2秒后我会变化你信不信？',
      // ),
      // StreamProvider<int>(
      //     create: (_){
      //       return Stream.periodic(Duration(milliseconds: 1000),(v){
      //         return v+1;
      //       }).take(100);
      //     },
      //     initialData: 0,
      // ),
      ChangeNotifierProvider<ThemeModel>( create: (_){ return ThemeModel(ThemeType.dark); }),
      ChangeNotifierProvider<TodoListModel>( create: (_){ return TodoListModel('sss',[]); })
    ],
    child: MyApp()
   ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //去除debug标签
      theme: Provider.of<ThemeModel>(context,listen: true).themeData,
      home: HomePage()//MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
