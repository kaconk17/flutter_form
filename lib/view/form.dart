import 'package:flutter/material.dart';

class FormRegister extends StatefulWidget {
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Form"),
        ),
        body: new Container(
          child: new Center(child: new Text("Ini formulir")),
        ));
  }
}
