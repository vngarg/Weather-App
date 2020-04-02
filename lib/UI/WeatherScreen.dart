import 'package:flutter/material.dart';

void main() => runApp(Weather());

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Weather'),
      ),
    );
  }
}