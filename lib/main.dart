import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterjson/app/constants.dart';
import 'package:flutterjson/bean/address.dart';
import 'package:flutterjson/utils/toast_utils.dart';

import 'bean/student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter 解析 json demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            GestureDetector(
              child: _buildItemText('普通 json 解析'),
              onTap: () {
                showToast(studentFromJson(studentJson).name);
              },
            ),
            GestureDetector(
              child: _buildItemText('普通 Bean 转 json'),
              onTap: () {
                showToast(studentToJson(studentFromJson(studentJson)));
              },
            ),
            GestureDetector(
              child: _buildItemText('解析带有数组的 json'),
              onTap: () {
                Address address = addressFromJson(addressJson);
                showToast('我来自 ${address.city} ${address.streets[0]}');
              },
            ),
          ],
        ));
  }

  Container _buildItemText(String title) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      color: Colors.pinkAccent,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}
