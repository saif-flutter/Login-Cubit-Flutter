import 'package:api/view/sign_up_screen.dart';
import 'package:api/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../controller/login_api_cubit/login_api_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // void login(String email,String password)
  // async{
  //   try{
  //     ProgressDialog progressDialog = ProgressDialog(context,
  //         message:const Text("This is the message"),
  //         title:const Text("This is the title")
  //     );
  //     progressDialog.setTitle(const Text("Loading"));
  //     progressDialog.setMessage(const Text("Loading"));
  //     // await Future.delayed(Duration(seconds: 5));
  //     progressDialog.show();
  //     Response response =await post(Uri.parse("https://inveoa.com/api/login"),
  //
  //         body: {
  //
  //         'email': email,
  //         'password': password,
  //         }
  //     );
  //     if(response.statusCode==200){
  //
  //       progressDialog.dismiss();
  //       var data = jsonDecode(response.body.toString());
  //       print('========================');
  //       print(data);
  //       Fluttertoast.showToast(msg: 'Account Login Succefully');
  //
  //
  //
  //       Navigator.push(context, MaterialPageRoute(builder: (context){
  //
  //         return  HomePage(data: data);
  //       }));
  //     }else
  //       {
  //         progressDialog.dismiss();
  //         Fluttertoast.showToast(msg: 'Failed Try Again');
  //       }
  //
  //
  //   }
  //
  //
  //   catch(e)
  //   {
  //
  //     print(e.toString());
  //   }
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: ListView(

          children: [
            Center(
              child: Image.asset('assets/images/blog.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            LoginTextField(text: 'Email', controller: emailController),

            const SizedBox(
              height: 20,
            ),

            LoginTextField(
                text: 'Password', controller: passwordController),

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
                    context.read<LoginApiCubit>().loginApi(
                        ctxx: context,
                        email: emailController.text.trim(),
                        password: passwordController.text.trim());
                    // login(emailController.text.toString(),passwordController.text.toString());


                  }, child: const Text('Login')),
            ),

            const SizedBox(
              height: 20,
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
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return const SignUpScreen();
                    }));
                  }, child: const Text('Sign Up')),
            ),

            BlocBuilder<LoginApiCubit, LoginApiState>(
              builder: (context, state) {
                if (state is LoginApiLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                /// loaded state
                if (state is LoginApiLoaded) {
                  return const Center(
                    child: Text('Pakistan'),

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
