import 'package:flutter/material.dart';
import 'package:front/widgets/appbar/bottom_appbar_menu.dart';

import '../widgets/user.dart';


class ConnectionPage extends StatefulWidget {
  @override
  _ConnectionPageState createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  final _formKey = GlobalKey<FormState>();
  final _userService = UserService(); // Create an instance of UserService

  String email = '';
  String password = '';
  String name = '';
  String firstName = '';

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var user = _userService.validateUser(email, password);
      if (user != null) {
        // Navigate to the home screen or dashboard
        Navigator.pushReplacementNamed(context,'/home');
      } else {
        // Show an error message
        _showErrorDialog();
      }
    }
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Here, you would usually send the data to your backend or authentication service
      // For now, let's just print the data to the console
      print('Name: $name, First Name: $firstName, Email: $email, Password: $password');
      // You should then navigate to a confirmation screen or back to the login
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Error"),
          content: new Text("Invalid email or password."),
          actions: <Widget>[
            new TextButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connection'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            // Connection form
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => email = value!,
              validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
              onSaved: (value) => password = value!,
              validator: (value) => value!.isEmpty ? 'Please enter your password' : null,
            ),
            TextButton(
              onPressed: () {
                // TODO: Navigate to password recovery page
              },
              child: Text('Mot de passe oublié ?'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  var user = _userService.validateUser(email, password);
                  if (user != null) {
                    // Navigate to the home screen or dashboard
                    Navigator.pushReplacementNamed(context, '/home'); // Replace with your home route
                  } else {
                    // Show an error message
                    _showErrorDialog();
                  }                }
              },
              child: Text('Connexion'),
            ),
            Divider(color: Colors.grey),
            // Registration form
            TextFormField(
              decoration: InputDecoration(labelText: 'Nom'),
              onSaved: (value) => name = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Prénom'),
              onSaved: (value) => firstName = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => email = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
              onSaved: (value) => password = value!,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // TODO: Perform registration with name, first name, email, and password
                }
              },
              child: Text('S\'inscrire'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBarMenu(),
    );
  }
}
