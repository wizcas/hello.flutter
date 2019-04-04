import 'package:flutter/material.dart';
import './detail.route.dart';

class LaunchRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Let's go!"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailRoute()));
          },
        ),
      ),
    );
  }
}
