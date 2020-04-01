import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {

  var location;
  final String hintText;
  TextFields({ Key key , this.hintText }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0 , right: 20.0 , top: 10.0),
      child: TextFormField(
        controller: location,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
        ),
        textAlign: TextAlign.center,
        
      ),
    );
  }
}