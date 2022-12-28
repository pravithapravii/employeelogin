import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loginpage/main.dart';
// import 'package:sample5/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isDataMatched = true;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'user name',
                ),
                validator: (value) {
                  // if (_isDataMatched) {
                  //   return null;
                  // } else {
                  //   return 'error';
                  // }
                  if (value == null || value.isEmpty) {
                    return 'value is Empty';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'password',
                ),
                validator: (value) {
                  //   if (_isDataMatched) {
                  //     return null;
                  //   } else {
                  //     return 'error';
                  //   }
                  if (value == null || value.isEmpty) {
                    return 'value is Empty';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: !_isDataMatched,
                    child: Text(
                      'Username Password  doesnot match',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        return checkLogin(context);
                      } else {
                        print('data empty');
                      }
                      // checkLogin(context);
                    },
                    icon: Icon(Icons.check),
                    label: Text('Login'),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username == password) {
      print('username and password match');
      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => SearchPage()));
    } else {
      print('username and password doesnot match');
    }
  }
}
