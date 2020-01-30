import 'package:flutter/material.dart';

class FormRegister extends StatefulWidget {
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  @override
  List<String> lvl_user = ["User", "Manager", "Administrator"];
  String _level = "User";

  void pilih_level(String value) {
    setState(() {
      _level = value;
    });
  }

  void _get_user() {
    _level = _level;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Form Register"),
        ),
        body: ListView(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(10.0),
              child: new Column(
                children: <Widget>[
                  TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Email")),
                  new Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Nama"),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Password"),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  new Row(
                    children: <Widget>[
                      new Text(
                        "Level User     ",
                        style: TextStyle(fontSize: 15),
                      ),
                      new DropdownButton(
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String value) {
                          pilih_level(value);
                        },
                        value: _level,
                        items: lvl_user.map((String value) {
                          return new DropdownMenuItem(
                              value: value, child: new Text(value));
                        }).toList(),
                      )
                    ],
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  new Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(left: 80),
                      ),
                      new RaisedButton(
                        child: new Text(
                          "Simpan",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          _get_user();
                        },
                      ),
                      new Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      new RaisedButton(
                        child: new Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          _get_user();
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
