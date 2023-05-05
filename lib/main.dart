// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'dummy_page.dart';

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
    print("call createState");
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      print("call setState");
      _counter++;
    });
    // nextpage();
  }

  void nextpage() async {
    print('ダミー画面に今から遷移します');
    // ダミー画面へ遷移
    await Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) {
      return DummyPage();
    }));
  }

  @override
  void initState() {
    super.initState();
    print("call initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("call didChangeDependencies");
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("call didUpdateWidget");
  }

  @override
  Widget build(BuildContext context) {
    print("call build");
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

  @override
  void deactivate() {
    super.deactivate();
    print("call deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("call dispose");
  }
}
