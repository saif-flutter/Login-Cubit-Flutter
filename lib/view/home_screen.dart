// import 'dart:async';
// import 'dart:convert';
//
//
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../model/dictionary_model.dart';
// import '../widgets/button_widgets.dart';
// import '../widgets/text_field.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   TextEditingController searchController = TextEditingController();
//
//   late StreamController _streamController;
//   late Stream _stream;
//
//   searchWord({required String wordSearch}) async {
//     if (wordSearch.isEmpty) {
//       print('Please Provide a Word');
//       _streamController.add(('empty'));
//       return;
//     }
//
//
//
//
//
//     _streamController.add('loading');
//     String url = "https://owlbot.info/api/v4/dictionary/$wordSearch";
//     var response = await http.get(Uri.parse(url), headers: {
//       "Authorization": "Token 9f495c0a3d29541627a7a6c3c59c504536317c23"
//     });
//     if (response.statusCode == 200) {
//       var jsonData = jsonDecode(response.body);
//       print(jsonData.toString());
//
//      // DictionaryModel model = DictionaryModel.fromJson(jsonData);
//       //
//       _streamController.add(Map<String, dynamic>.from(jsonData));
//     } else {
//       print('Something went wrong');
//       _streamController.add('notFound');
//     }
//
//   }
//
//
//
//
//
//   @override
//   void initState() {
//     _streamController = StreamController();
//     _stream = _streamController.stream;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Dictionary"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: ListView(
//           children: [
//             LoginTextField(text: 'Search', controller: searchController),
//             const SizedBox(
//               height: 40,
//             ),
//             Button(
//                 titleName: 'Search',
//                 onpressed: () {
//                   final wordSearch = searchController.text.trim();
//
//                   searchWord(wordSearch: wordSearch);
//                 },
//                 color: const Color(0xff2277c2),
//                 textStyle: const TextStyle(fontWeight: FontWeight.bold)),
//             StreamBuilder(
//                 stream: _stream,
//                 builder: (context, snapshot) {
//
//                   if(snapshot.hasData){
//
//                     if (snapshot.data == 'empty') {
//                       return const Padding(
//                         padding: EdgeInsets.all(20.0),
//                         child: Center(
//                           child: Text('Please Provide a Word'),
//                         ),
//                       );
//                     } else if (snapshot.data == 'loading') {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     } else if (snapshot.data == 'notFound') {
//                       return const Center(
//                         child: Text("Data Not Found"),
//                       );
//                     } else if (snapshot.data == 'wrong') {
//                       return const Center(
//                         child: Text('Something went wrong'),
//                       );
//                     } else {
//                       var data = snapshot.data as Map<String, dynamic>;
//                       var word = DictionaryModel.fromJson(data);
//
//                       print(word.word);
//                       print(word.definitions![0].example);
//                       return ListView.builder(
//                           scrollDirection: Axis.vertical,
//                           shrinkWrap: true,
//                           itemCount: word.definitions?.length,
//                           itemBuilder: (context, index) {
//                             var data = word.definitions![index];
//
//                             return SizedBox(
//                               height: 400,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(top: 20.0),
//                                 child: ListView(
//                                   scrollDirection: Axis.vertical,
//                                   children: [
//                                     CircleAvatar(
//
//                                       child: ClipOval(
//                                         child: Image.network(data.imageUrl.toString(),fit: BoxFit.fill,),
//                                       ),
//                                       // backgroundImage:
//                                       //
//                                       radius: 80,
//                                       backgroundColor: Colors.transparent,
//                                     ),
//                                     Card(
//                                         elevation: 8,
//                                         child: Text(
//                                           "Word: ${word.word}",
//                                           style: const TextStyle(
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold),
//                                         )),
//                                     Card(
//                                         elevation: 8,
//                                         child: Text(
//                                           "Pronunciation:${word.pronunciation}",
//                                           style: const TextStyle(
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold),
//                                         )),
//                                     Card(
//                                         elevation: 8,
//                                         child: Text(
//                                           "Emoji:${data.emoji}",
//                                           style: const TextStyle(
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold),
//                                         )),
//                                     Card(
//                                         elevation: 8,
//                                         child: Text(
//                                           "Example:${data.emoji}",
//                                           style: const TextStyle(
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold),
//                                         )),
//                                     Card(
//                                         elevation: 8,
//                                         child: Text(
//                                           "Type:${data.type}",
//                                           style: const TextStyle(
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold),
//                                         )),
//                                     Card(
//                                         elevation: 8,
//                                         child: Text(
//                                           "Definition:${data.definition}",
//                                           style: const TextStyle(
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold),
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           });
//                     }
//                   }else{
//                     return Container(
//                     );
//                   }
//
//
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
