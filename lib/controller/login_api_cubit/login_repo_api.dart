
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:ndialog/ndialog.dart';

import '../../view/home_page.dart';

class LoginRepoApi{


  static login(BuildContext ctx, String email,String password)
  async{
    try{
      ProgressDialog progressDialog = ProgressDialog(ctx,
          message:const Text("This is the message"),
          title: const Text("This is the title")
      );
      progressDialog.setTitle(const Text("Loading"));
      progressDialog.setMessage(const Text("Loading"));
      // await Future.delayed(Duration(seconds: 5));
      progressDialog.show();

      Response response =await post(Uri.parse("https://inveoa.com/api/login"),
          body: {
            'email': email,
            'password': password,
          }
      );
      if(response.statusCode==200){

        progressDialog.dismiss();
        var data = jsonDecode(response.body.toString());

        debugPrint('=========================');
        debugPrint(data);
        Fluttertoast.showToast(msg: 'Account Login Successfully');



        Navigator.push(ctx, MaterialPageRoute(builder: (context){
          return  HomePage(data: data);
        }));

      }else
      {
        progressDialog.dismiss();
        Fluttertoast.showToast(msg: 'Failed Try Again');
        return null;
      }


    }


    catch(e)
    {
      debugPrint(e.toString());
      return null;
    }

  }
}