import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List> getUser() async {
  final response =
      await http.get("http://10.0.3.2/pasar_credit/public/api/user");
}
