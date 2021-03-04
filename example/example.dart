import 'package:flutter/material.dart';
import 'package:loading_skeleton/loading_skeleton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loading Skeleton',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Loading Skeleton Example'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            LoadingSkeleton(
              width: 400,
              height: 250,
              margin: EdgeInsets.all(16),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, i) => ListItem(),
              itemCount: 4,
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LoadingSkeleton(
          width: 100,
          height: 100,
          margin: EdgeInsets.only(left: 16, top: 16),
          animationDuration: 3300,
          animationEnd: AnimationEnd.MODERATELY_ON_TOP,
          colors: [Colors.amber, Colors.purpleAccent, Colors.amber],
        ),
        LoadingSkeleton(
          width: 280,
          height: 100,
          margin: EdgeInsets.only(left: 16, top: 16, right: 16),
          colors: [
            Colors.blueAccent,
            Colors.deepOrangeAccent,
            Colors.blueAccent,
          ],
        ),
      ],
    );
  }
}
