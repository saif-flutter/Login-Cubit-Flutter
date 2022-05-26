import 'dart:convert';

import 'package:api/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class SignUpRepoAPi {
  static signApi(
      BuildContext context, String name, String email, String password) async {
    try {
      Response response = await post(Uri.parse('https://inveoa.com/api/signup'),
          body: {'name': name, 'email': email, 'password': password});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        debugPrint(data);
        Fluttertoast.showToast(msg: 'Account Created Succefully');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const LoginScreen();
        }));
      } else {
        Fluttertoast.showToast(msg: 'Sorry ');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
