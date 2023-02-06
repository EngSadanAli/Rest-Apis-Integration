import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginSignUpApI extends StatefulWidget {
  const LoginSignUpApI({super.key});

  @override
  State<LoginSignUpApI> createState() => _LoginSignUpApIState();
}

class _LoginSignUpApIState extends State<LoginSignUpApI> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, password) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/register'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        //here var data for get data from inner response token and id etc
        var data = jsonDecode(response.body.toString());
        print(data);
        print('Created Succ');
      } else {
        print('field');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(
              height: 29,
            ),
            GestureDetector(
              onTap: () {
                login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(color: Colors.amber),
                child: Center(
                    child: Text(
                  "Registraion",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
