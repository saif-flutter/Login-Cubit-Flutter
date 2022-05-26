import 'package:api/controller/signup_api_cubit/sign_up_api_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
@override
  void initState() {
    super.initState();
  }
  // void signup(String name,email,password) async {
  //   try {
  //     Response response = await post(Uri.parse('https://inveoa.com/api/signup'),
  //         body: {
  //
  //           'name': name,
  //           'email': email,
  //           'password': password
  //         }
  //
  //
  //     );
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //
  //
  //       print(data);
  //       Fluttertoast.showToast(msg: 'Account Created Succefully');
  //       Navigator.push(context, MaterialPageRoute(builder: (context) {
  //         return const LoginScreen();
  //       }));
  //     }
  //     else {
  //       Fluttertoast.showToast(msg: 'Sorry ');
  //     }
  //   }
  //
  //   catch (e) {
  //     print(e.toString());
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign  UP'),
      ),
      body:Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListView(

              children: [
                const Center(child: Text('SignUp ', style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 28),)),
                const SizedBox(
                  height: 20,
                ),
                LoginTextField(text: 'Name', controller: nameController),
                const SizedBox(
                  height: 20,
                ),
                LoginTextField(text: 'Email', controller: emailController),

                const SizedBox(
                  height: 20,
                ),

                LoginTextField(text: 'Password', controller: passController),

                const SizedBox(
                  height: 50,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),

                      onPressed: () {
                        // //    login(emailController.text.toString(),passwordController.text.toString());
                        // signup(nameController.text.toString(),
                        //     emailController.text.toString(),
                        //     passController.text.toString());
                        context.read<SignUpApiCubit>().signApi(
                            context: context,
                            name: nameController.text.trim(), email: emailController.text.trim(), password: passController.text.trim());
                        // Navigator.push(context, MaterialPageRoute(builder: (context){
                        //   return const LoginScreen();
                        // }));
                      },

                      child: const Text('Sign Up')),
                ),

                const SizedBox(
                  height: 20,
                ),

                // ElevatedButton(onPressed: (){
                //   Navigator.push(context, MaterialPageRoute(builder: (context){
                //
                //     return const LoginScreen();
                //   }));
                //
                //
                // }, child: const Text('Login'))

                BlocBuilder<SignUpApiCubit, SignUpApiState>(
                  builder: (context, state) {
                    if (state is SignUpApiInitial) {
                      return const Center(
                        child: Text(''),
                      );
                    }

                    /// loaded state
                    if (state is SignUpApiLoaded) {
                      return Center(
                        child: Text(state.userModel.data.toString()),

                      );
                    }

                    /// error state
                    else {
                      return const Center(
                        child: Text(''),
                      );
                    }
                  },
                )






              ],
            ),
          ),

    );

  }
}
