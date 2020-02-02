import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  Future<List> getUser() async {
    final response =
        await http.get("http://10.0.3.2:8888/pasar_kredit/public/api/user");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text("Daftar User")),
      body: new FutureBuilder<List>(
        future: getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new daftarUser(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class daftarUser extends StatelessWidget {
  final List list;
  daftarUser({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Card(
            child: new ListTile(
              title: Text(list[i]['name']),
              //leading: Icon(Icons.account_circle),
              leading: list[i]['profile_picture'] == null
                  ? Icon(Icons.account_circle)
                  : CircleAvatar(
                      radius: 50,
                      child: ClipOval(
                        child: Image.network(
                            "http://10.0.3.2:8888/pasar_kredit/public/assets/img/profile/${list[i]['profile_picture']}"),
                      ),
                      //backgroundImage: NetworkImage(
                      //  "http://10.0.3.2:8888/pasar_kredit/public/assets/img/profile/${list[i]['profile_picture']}"),
                    ),

              subtitle: Text("Email : ${list[i]['email']}"),
            ),
          ),
        );
      },
    );
  }
}
