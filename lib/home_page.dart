import 'package:flutter/material.dart';
import 'package:f_flutter/model/theme_model.dart';
import 'package:f_flutter/model/todo_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("首页"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
       
            FlatButton(
              onPressed: () {
                Provider.of<ThemeModel>(context, listen: false).reverse();
              },
              child: Consumer<ThemeModel>(
                builder: (context, t, child) {
                  String result = "Consumer切换成";
                  if (t.currentType == ThemeType.dark) {
                    result += "白天模式";
                  } else {
                    result += "夜间模式";
                  }
                  return Text(result);
                },
              ),
            ),
            // FlatButton(
            //   onPressed: () {
            //     Provider.of<ThemeModel>(context, listen: false).reverse();
            //   },
            //   child: Selector<ThemeModel, ThemeType>(
            //     builder: (context, type, child) {
            //       String result = "Selector切换成";
            //       if (type == ThemeType.dark) {
            //         result += "白天模式";
            //       } else {
            //         result += "夜间模式";
            //       }
            //       return Text(result);
            //     },
            //     selector: (context, themeModel) {
            //       return themeModel.currentType;
            //     },
            //     shouldRebuild: (pre, next) {
            //       return pre != next;
            //     },
            //   ),
            // ),
            Container(
                child: Consumer<TodoListModel>(
                builder: (context, t, child) {
                  if(t.nameArr.length==0){
                    return Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('还没有添加数据，请添加!',textAlign: TextAlign.center,)
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(), //去除内部滚动
                      itemBuilder: (c,i){
                        return Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 30),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Text('${i+1} . ${t.nameArr[i]}'),
                              Row(
                                children:[
                                  InkWell(
                                    child:Icon(Icons.all_inclusive),
                                    onTap:(){
                                      print(i);
                                      t.remove(i);
                                    }
                                  ),
                                  InkWell(
                                    child:Icon(Icons.remove_circle_outline),
                                    onTap:(){
                                      print(i);
                                      t.remove(i);
                                    }
                                  )
                                ]
                              )
                            ]
                          )
                        );
                      },
                    itemCount: t.nameArr.length
                  );
                },
              ),
            ),
             FlatButton(
              onPressed: () {
                Provider.of<TodoListModel>(context, listen: false).change(DateTime.now().toString());
              },
              child: Text('添加'),
            ),
          ],
        ),
      ),
    );
  }
}