import 'package:api/widgets/button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/dictionary_api_cubit/dictionary_api_cubit.dart';
import '../widgets/text_field.dart';

class HomePage extends StatefulWidget {
  final Map<String, dynamic> data;

  const HomePage({Key? key, required this.data}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  // late StreamController _streamController;
  // late Stream _stream;

  // late StreamController _streamController;
  // late Stream _stream;
  // searchWord({required String wordSearch}) async {
  //   if (wordSearch.isEmpty) {
  //     print('Please Provide a Word');
  //     _streamController.add(('empty'));
  //     return;
  //   }
  //   _streamController.add('loading');
  //   String url = "https://owlbot.info/api/v4/dictionary/$wordSearch";
  //   var response = await http.get(Uri.parse(url), headers: {
  //     "Authorization": "Token 9f495c0a3d29541627a7a6c3c59c504536317c23"
  //   });
  //   if (response.statusCode == 200) {
  //     var jsonData = jsonDecode(response.body);
  //     print(jsonData.toString());
  //
  //     // DictionaryModel model = DictionaryModel.fromJson(jsonData);
  //     //
  //     _streamController.add(Map<String, dynamic>.from(jsonData));
  //   } else {
  //     print('Something went wrong');
  //     _streamController.add('notFound');
  //   }
  // }

  // void getUserData() async {
  //   var url = 'https://inveoa.com/api/login';
  //   var response = await post(Uri.parse(url), body: {
  //     'email': widget.email,
  //     'password': widget.password,
  //   });
  //   if (response.statusCode == 200) {
  //     var jsonData = jsonDecode(response.body);
  //     Data userModel = Data.fromJson(jsonData);
  //
  //     _streamController.add(userModel);
  //
  //     // print(userModel);
  //
  //   } else {
  //     _streamController.add('wrong');
  //   }
  // }



  // @override
  // void initState() {
  //   // _streamController = StreamController();
  //   // _stream = _streamController.stream;
  //   // _streamController.add('loading');
  //   // getUserData();
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Successfully'),
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.push(context, MaterialPageRoute(builder: (context) {
        //         return const LoginScreen();
        //       }));
        //     },
        //     icon: const Icon(Icons.exit_to_app)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            LoginTextField(text: 'Search', controller: searchController),
            const SizedBox(
              height: 40,
            ),
            Button(
                titleName: 'Search',
                onpressed: () {
                  context
                      .read<DictionaryApiCubit>()
                      .dictionaryApi(name: searchController.text.trim());
                  // searchWord(wordSearch: wordSearch);
                },
                color: const Color(0xff2277c2),
                textStyle: const TextStyle(fontWeight: FontWeight.bold)),
            // StreamBuilder(
            //     stream: _stream,
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         if (snapshot.data == 'empty') {
            //           return const Padding(
            //             padding: EdgeInsets.all(20.0),
            //             child: Center(
            //               child: Text('Please Provide a Word'),
            //             ),
            //           );
            //         } else if (snapshot.data == 'loading') {
            //           return const Center(
            //             child: CircularProgressIndicator(),
            //           );
            //         } else if (snapshot.data == 'notFound') {
            //           return const Center(
            //             child: Text("Data Not Found"),
            //           );
            //         } else if (snapshot.data == 'wrong') {
            //           return const Center(
            //             child: Text('Something went wrong'),
            //           );
            //         } else {
            //           var data = snapshot.data as Map<String, dynamic>;
            //           var word = DictionaryModel.fromJson(data);
            //
            //           print(word.word);
            //           print(word.definitions![0].example);
            //           return ListView.builder(
            //               scrollDirection: Axis.vertical,
            //               shrinkWrap: true,
            //               itemCount: word.definitions?.length,
            //               itemBuilder: (context, index) {
            //                 var data = word.definitions![index];
            //
            //                 return SizedBox(
            //                   height: 500,
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(top: 20.0),
            //                     child: ListView(
            //                       scrollDirection: Axis.vertical,
            //                       children: [
            //                         CircleAvatar(
            //                           child: ClipOval(
            //                             child: Image.network(
            //                               data.imageUrl.toString(),
            //                               fit: BoxFit.fill,
            //                             ),
            //                           ),
            //                           // backgroundImage:
            //                           //
            //                           radius: 80,
            //                           backgroundColor: Colors.transparent,
            //                         ),
            //                         SizedBox(
            //
            //                           height: 40,
            //                           child: Card(
            //                               elevation: 8,
            //                               child: Text(
            //                                 "Word: ${word.word}",
            //                                 style: const TextStyle(
            //                                     fontSize: 18,
            //                                     fontWeight: FontWeight.bold),
            //                               )),
            //                         ),
            //                         SizedBox(
            //
            //                           height: 40,
            //                           child: Card(
            //                               elevation: 8,
            //                               child: Text(
            //                                 "Pronunciation:${word.pronunciation}",
            //                                 style: const TextStyle(
            //                                     fontSize: 18,
            //                                     fontWeight: FontWeight.bold),
            //                               )),
            //                         ),
            //                         SizedBox(
            //
            //                           height: 40,
            //                           child: Card(
            //                               elevation: 8,
            //                               child: Text(
            //                                 "Emoji:${data.emoji}",
            //                                 style: const TextStyle(
            //                                     fontSize: 18,
            //                                     fontWeight: FontWeight.bold),
            //                               )),
            //                         ),
            //                         SizedBox(
            //
            //                           height: 40,
            //                           child: Card(
            //                               elevation: 8,
            //                               child: Text(
            //                                 "Example:${data.emoji}",
            //                                 style: const TextStyle(
            //                                     fontSize: 18,
            //                                     fontWeight: FontWeight.bold),
            //                               )),
            //                         ),
            //                         SizedBox(
            //
            //                           height: 40,
            //                           child: Card(
            //                               elevation: 8,
            //                               child: Text(
            //                                 "Type:${data.type}",
            //                                 style: const TextStyle(
            //                                     fontSize: 18,
            //                                     fontWeight: FontWeight.bold),
            //                               )),
            //                         ),
            //                         SizedBox(
            //
            //                           height: 100,
            //                           child: Card(
            //                               elevation: 8,
            //                               child: Text(
            //                                 "Definition:${data.definition}",
            //                                 style: const TextStyle(
            //                                     fontSize: 18,
            //                                     fontWeight: FontWeight.bold),
            //                               )),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 );
            //               });
            //         }
            //       } else {
            //         return Container();
            //       }
            //     })

            BlocBuilder<DictionaryApiCubit, DictionaryApiState>(
              builder: (context, state) {
                if (state is DictionaryApiLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                /// loaded state
                if (state is DictionaryApiLoadedState) {


                  return Container(
                    color: Colors.white,
                    height: size.height * 0.9,
                    child: Column(

                      children: [
                        // Text(state.dictionaryModel.word!),
                        Expanded(child: ListView.builder(
                            itemCount: state.dictionaryModel.definitions!.length,
                            itemBuilder: (context, index){
                             var data = state.dictionaryModel.definitions![index];
                          return Column(
                            children: [
                              CircleAvatar(
                                child: ClipOval(
                                  child: Image.network(
                                    // data.imageUrl.toString(),
                                    data.imageUrl.toString(),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                // backgroundImage:

                                radius: 80,
                                backgroundColor: Colors.transparent,
                              ),

                              SizedBox(

                                              height: 40,
                                              child: Card(
                                                  elevation: 8,
                                                  child: Text(
                                                    "Word: ${state.dictionaryModel.word!}",
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold),
                                                  )),
                                            ),
                              SizedBox(

                                              height: 40,
                                              child: Card(
                                                  elevation: 8,
                                                  child: Text(
                                                    "Pronunciation:${state.dictionaryModel.pronunciation}",
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold),
                                                  )),
                                            ),
                              SizedBox(

                                height: 120,
                                child: Card(
                                    elevation: 8,
                                    child: Text(
                                      "Definition:${data.definition}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),



                            ],
                          );
                        }

                        )
                        ),

                      ],
                    ),
                  );


                  // return ListView.builder(
                  //     scrollDirection: Axis.vertical,
                  //     shrinkWrap: true,
                  //     itemCount: word.definitions?.length,
                  //     itemBuilder: (context, index) {
                  //       var data = word.definitions![index];
                  //       return SizedBox(
                  //         height: 500,
                  //         child: Padding(
                  //           padding: const EdgeInsets.only(top: 20.0),
                  //           child: ListView(
                  //             scrollDirection: Axis.vertical,
                  //             children: [
                  //               CircleAvatar(
                  //                 child: ClipOval(
                  //                   child: Image.network(
                  //                     data.imageUrl.toString(),
                  //                     fit: BoxFit.fill,
                  //                   ),
                  //                 ),
                  //                 // backgroundImage:
                  //                 //
                  //                 radius: 80,
                  //                 backgroundColor: Colors.transparent,
                  //               ),
                  //               SizedBox(
                  //
                  //                 height: 40,
                  //                 child: Card(
                  //                     elevation: 8,
                  //                     child: Text(
                  //                       "Word: ${word.word}",
                  //                       style: const TextStyle(
                  //                           fontSize: 18,
                  //                           fontWeight: FontWeight.bold),
                  //                     )),
                  //               ),
                  //               SizedBox(
                  //
                  //                 height: 40,
                  //                 child: Card(
                  //                     elevation: 8,
                  //                     child: Text(
                  //                       "Pronunciation:${word.pronunciation}",
                  //                       style: const TextStyle(
                  //                           fontSize: 18,
                  //                           fontWeight: FontWeight.bold),
                  //                     )),
                  //               ),
                  //               SizedBox(
                  //
                  //                 height: 40,
                  //                 child: Card(
                  //                     elevation: 8,
                  //                     child: Text(
                  //                       "Emoji:${data.emoji}",
                  //                       style: const TextStyle(
                  //                           fontSize: 18,
                  //                           fontWeight: FontWeight.bold),
                  //                     )),
                  //               ),
                  //               SizedBox(
                  //
                  //                 height: 40,
                  //                 child: Card(
                  //                     elevation: 8,
                  //                     child: Text(
                  //                       "Example:${data.emoji}",
                  //                       style: const TextStyle(
                  //                           fontSize: 18,
                  //                           fontWeight: FontWeight.bold),
                  //                     )),
                  //               ),
                  //               SizedBox(
                  //
                  //                 height: 40,
                  //                 child: Card(
                  //                     elevation: 8,
                  //                     child: Text(
                  //                       "Type:${data.type}",
                  //                       style: const TextStyle(
                  //                           fontSize: 18,
                  //                           fontWeight: FontWeight.bold),
                  //                     )),
                  //               ),
                  //               SizedBox(
                  //
                  //                 height: 100,
                  //                 child: Card(
                  //                     elevation: 8,
                  //                     child: Text(
                  //                       "Definition:${data.definition}",
                  //                       style: const TextStyle(
                  //                           fontSize: 18,
                  //                           fontWeight: FontWeight.bold),
                  //                     )),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     });


                //////////////


                }

                /// error state
                else {
                return const Center(
                child: Text('Data Not Found'),
                );
                }
              },
            )
          ],
        ),
      ),

      // body: StreamBuilder(
      //     stream: _stream,
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         if (snapshot.data == 'loading') {
      //           return const Center(child: CircularProgressIndicator());
      //         } else if (snapshot.data == 'wrong') {
      //           return const Text('Something went Wrong');
      //         } else {
      //           Data userList = snapshot.data as Data;
      //           Drawer(
      //             child:  ListView(
      //               children: [
      //                 const Padding(
      //                   padding: EdgeInsets.all(18.0),
      //                   child: Center(
      //                     child: Text(
      //                       'User Detail',
      //                       style: TextStyle(
      //                           fontSize: 28,
      //                           fontWeight: FontWeight.bold,
      //                           letterSpacing: 1.2),
      //                     ),
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: 100,
      //                   child: ClipOval(
      //                       child: Image.network(
      //                         userList.profilePhotoUrl.toString(),
      //                         // fit: BoxFit.fill,
      //                       )),
      //                 ),
      //                 const SizedBox(
      //                   height: 20,
      //                 ),
      //                 Center(
      //                     child: Text(
      //                       "Name:${userList.name.toString()}",
      //                       style: const TextStyle(fontSize: 20),
      //                     )),
      //                 const SizedBox(
      //                   height: 20,
      //                 ),
      //                 Center(
      //                     child: Text(
      //                       "Email:${userList.email}",
      //                       style: const TextStyle(fontSize: 20),
      //                     )),
      //                 const SizedBox(
      //                   height: 20,
      //                 ),
      //                 Center(
      //                     child: Text(
      //                       "ID:${userList.id}",
      //                       style: const TextStyle(fontSize: 20),
      //                     )),
      //                 const SizedBox(
      //                   height: 20,
      //                 ),
      //                 Center(
      //                     child: Text(
      //                       "OTP:${userList.otp}",
      //                       style: const TextStyle(fontSize: 20),
      //                     )),
      //                 Padding(
      //                   padding: const EdgeInsets.only(top: 48.0),
      //                   child: Center(
      //                     child: Button(
      //                         titleName: 'Go TO Dictionary',
      //                         onpressed: () {
      //                           Navigator.push(context,
      //                               MaterialPageRoute(builder: (context) {
      //                                 return const HomeScreen();
      //                               }));
      //                         },
      //                         color: const Color(0xff2277c2),
      //                         textStyle: const TextStyle(color: Colors.white)),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           );
      //           //   print(userList);
      //
      //
      //         }
      //       }
      //
      //       return Text('');
      //     }
      //     ),

      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              color: Colors.blue,
              height: 150,
              child: Image.network(widget.data['data']['profile_photo_url']),
            ),
            Column(
              children: [
                const Text(
                  'Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.data['data']['name'],
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.data['data']['email'],
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
