// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  // Stream
  final _counterStream = StreamController<int>();

  // 初期化時にConsumerのコンストラクタにStreamを渡す
  @override
  void initState() {
    super.initState();
    Consumer(_counterStream);
  }

  // 終了時にStreamを解放する
  @override
  void dispose() {
    super.dispose();
    _counterStream.close();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    // カウントアップした後に、Streamにカウンタ値を流す
    _counterStream.sink.add(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Consumerクラス
class Consumer {
  //コンストラクタでint型のStreamを受け取る
  Consumer(StreamController<int> consumeStream) {
    // Streamをlistenしてデータが来たらターミナルに表示する
    consumeStream.stream.listen((data) async {
      print("consumerが$dataを使ったよ");
    });
  }
}
