import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final title = 'サンプルタイトル';
  final message = 'サンプル・メッセージ';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(
          title: title,
          message: message
      ),
    );
  }
}

//StatefulWidgetの定義
class MyHomePage extends StatefulWidget {
  final String title;
  final String message;
  const MyHomePage({
    Key? key,
    required this.title,
    required this.message
  }): super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//ステートクラス
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    //以下をステートの操作に応じてへ変化するように処理をする
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text(
        widget.message,
        style: TextStyle(fontSize:32.0),
      ),
    );
  }
}
