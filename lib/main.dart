import 'package:flutter/material.dart';

import 'package:form/view/listUser.dart';

void main() {
  runApp(new MaterialApp(
    title: "Sidebar",
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("My App Home"),
        backgroundColor: Colors.blue,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("MyApp"),
                accountEmail: new Text("test@email.com"),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.green,
                ),
                decoration: new BoxDecoration(color: Colors.red)),
            new GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new UserList()));
              },
              child: new ListTile(
                title: new Text("Register"),
                trailing: new Icon(Icons.supervisor_account),
              ),
            ),
            new ListTile(
              title: new Text("Setting"),
              trailing: new Icon(Icons.settings),
            ),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
            )
          ],
        ),
      ),
      body: new Container(),
    );
  }
}
