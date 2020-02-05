import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserClass extends StatelessWidget {
  Future<List> getUser() async {
    final response =
        await http.get("http://10.0.3.2:8888/pasar_kredit/public/api/user");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class daftarUser extends StatelessWidget {
  final List list;
  daftarUser({this.list});
  String link = "";
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Card(
            child: new ListTile(
              leading: list[i]['profile_picture'] == null
                  ? CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      child: Image.network(
                          "http://10.0.3.2:8888/pasar_kredit/public/assets/img/user.png"),
                    )
                  : CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      child: Image.network(
                          "http://10.0.3.2:8888/pasar_kredit/public/assets/img/profile/${list[i]['profile_picture']}"),
                    ),
              title: Text(list[i]['name']),
              subtitle: Text("Email : ${list[i]['email']}"),
            ),
          ),
        );
      },
    );
  }
}
