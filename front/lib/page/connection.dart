import 'package:flutter/material.dart';
import 'package:front/widgets/appbar/bottom_appbar_menu.dart';


class ConnectionPage extends StatefulWidget {
  @override
  _ConnectionPageState createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name = '';
  String firstName = '';

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
                  // TODO: Perform connection with email and password
                }
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
