import 'package:flutter/material.dart';
import 'package:form/model/UserModel.dart';
//import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class FormRegister extends StatefulWidget {
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  User _user;
  //final dateFormat = DateFormat("yyyy-MM-dd");
  @override
  String _kelamin = "";
  String _date = "Not Set";

  void _pilihjk(String value) {
    setState(() {
      _kelamin = value;
    });
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
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Tanggal Lahir',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    elevation: 2.0,
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          theme: DatePickerTheme(
                            containerHeight: 210.0,
                          ),
                          showTitleActions: true,
                          minTime: DateTime(1960, 1, 1),
                          maxTime: DateTime.now(), onConfirm: (date) {
                        print('confirm $date');
                        _date = '${date.year} - ${date.month} - ${date.day}';
                        setState(() {});
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.date_range,
                                        size: 18.0, color: Colors.black),
                                    Text(
                                      " $_date",
                                      style: TextStyle(
                                          //color: Colors.black,
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Text(
                            "  Change",
                            style: TextStyle(
                                color: Colors.blue,
                                //fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20.0,
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
                        onPressed: () {},
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
