import 'dart:convert';

import 'package:api/model/dictionary_model.dart';
import 'package:http/http.dart'as http;
class DictionaryApiRepo{


  static Future<DictionaryModel?>dictionaryApi(String name)
  async{
    try{
      var headers = {
        'Authorization': 'Token 9f495c0a3d29541627a7a6c3c59c504536317c23',
        'Cookie': 'csrftoken=NPcXGFYLmGL4CfuAzKmTYbc7Li4UnTFbFSeNEANgo0ylEwsS6nwPzdvfI4HznWu5'
      };

      var response = await http.get(Uri.parse('https://owlbot.info/api/v4/dictionary/$name'), headers: headers);

      if (response.statusCode == 200) {
        final jsonData= jsonDecode(response.body);
        print('response: ${jsonData}');
        return DictionaryModel.fromJson(jsonData);

      }
      else {
        print(response.reasonPhrase);
        return null;
      }


    }
    catch(e) {
      print(e.toString());
    }
    return null;


  }
}