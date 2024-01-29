import 'package:flutter/material.dart';
import 'package:front/widgets/appbar/bottom_appbar_menu.dart';
import 'package:go_router/go_router.dart';
import '../widgets/user.dart'; // Adjust the import path based on your project structure

class ConnectionPage extends StatefulWidget {
  @override
  _ConnectionPageState createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  final _formKey = GlobalKey<FormState>();
  final _userService = UserService();
  final _loginFormKey = GlobalKey<FormState>();
  final _registerFormKey = GlobalKey<FormState>();

  // Login state
  String email = '';
  String password = '';

  // Registration state
  String regEmail = '';
  String regPassword = '';
  String regName = '';
  String regFirstName = '';

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var user = _userService.validateUser(email, password);
      if (user != null) {
        context.go('/home');
      } else {
        _showErrorDialog('Invalid email or password.');
      }
    }
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _userService.registerUser(regEmail, regPassword);
      _showSuccessDialog('User successfully registered.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Success"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () => Navigator.of(context).pop(),
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
              onSaved: (value) => email = value ?? '',
              validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
              onSaved: (value) => password = value ?? '',
              validator: (value) => value!.isEmpty ? 'Please enter your password' : null,
            ),
            TextButton(
              onPressed: () {
                // Navigate to password recovery page
              },
              child: Text('Mot de passe oublié ?'),
            ),
            ElevatedButton(
              onPressed: _login,
              child: Text('Connexion'),
            ),
            Divider(color: Colors.grey),
            // Registration form
            TextFormField(
              decoration: InputDecoration(labelText: 'Nom'),
              onSaved: (value) => regName = value ?? '',
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Prénom'),
              onSaved: (value) => regFirstName = value ?? '',
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => regEmail = value ?? '',
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
              onSaved: (value) => regPassword = value ?? '',
            ),
            ElevatedButton(
              onPressed: _register,
              child: Text('S\'inscrire'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBarMenu(),
    );
  }
}
