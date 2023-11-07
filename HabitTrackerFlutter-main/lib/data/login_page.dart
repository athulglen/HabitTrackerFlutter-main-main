import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import 'admin_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _loginPressed() {
    String username = _usernameController.text;
  String password = _passwordController.text;
  // you could implement your own logic to check if the entered password matches with the corresponding username's password in your database or storage
  if (username == 'admin' && password == 'admin') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AdminPage()),
    );
    // handle successful login
  }
  // Check if the entered credentials match with a regular user account
  else if (username == 'athul' && password == '682528') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
    // handle successful login
  } else if (username == 'Shalwin' && password == 'Shalwin123') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
    // handle successful login
  } 
  else if (username == 'Aedrin' && password == 'Aedrin123') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
    // handle successful login
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Invalid username or password')),
    );
    // handle invalid credentials
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body:  Stack(
        children: [
          Image.network(
            'https://c4.wallpaperflare.com/wallpaper/604/488/27/iphone-ios-ipad-ipod-wallpaper-preview.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _loginPressed,
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}