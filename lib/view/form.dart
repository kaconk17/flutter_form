import 'package:flutter/material.dart';
import 'package:form/model/UserModel.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class FormRegister extends StatefulWidget {
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  User _user;
  final dateFormat = DateFormat("yyyy-MM-dd");
  @override
  List<String> lvl_user = ["User", "Manager", "Administrator"];
  String _level = "User";
  String _kelamin = "";

  void _pilihjk(String value) {
    setState(() {
      _kelamin = value;
    });
  }

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
                      //controller: _user.EmailUser,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Email")),
                  new Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  TextField(
                    //controller: _user.NamaUser,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Nama"),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  TextField(
                    //controller: _user.PassUser,
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
                        "Jenis Kelamin :    ",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  new RadioListTile(
                    value: "L",
                    title: Text("Laki-Laki"),
                    groupValue: _kelamin,
                    onChanged: (String value) {
                      _pilihjk(value);
                    },
                    activeColor: Colors.blue,
                  ),
                  new RadioListTile(
                    value: "P",
                    title: Text("Perempuan"),
                    groupValue: _kelamin,
                    onChanged: (String value) {
                      _pilihjk(value);
                    },
                    activeColor: Colors.blue,
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Row(
                    children: <Widget>[
                      Text('Basic date field (${dateFormat.pattern})'),
                    ],
                  ),
                  DateTimeField(
                    format: dateFormat,
                    onShowPicker: (context, currentValue) async {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    },
                  ),
                  new Row(
                    children: <Widget>[
                      new Text(
                        "Level User :    ",
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
                      ),
                    ],
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Center(
                      child: Container(
                          child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  )))
                ],
              ),
            ),
          ],
        ));
  }
}
