import 'package:flutter/material.dart';
import 'package:front/functionApi/auth_service.dart';
import 'package:front/model/address.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:front/functionApi/fetchAddress.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SignupPage(),
    );
  }
}

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscription'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade200,
              Colors.blueAccent.shade700,
              Colors.blue.shade900,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TopSection(),
              InputSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Déjà un compte ?',
            style: GoogleFonts.comfortaa(color: Colors.white),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Connectez-vous',
                style: GoogleFonts.comfortaa(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
    );
  }
}

class InputSection extends StatefulWidget {
  const InputSection ({super.key});

  @override
  State<InputSection > createState() => _InputSectionState();
}

class _InputSectionState extends State<InputSection > {
  final TextEditingController _pseudoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();

  @override
  void dispose() {
    _pseudoController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nomController.dispose();
    _prenomController.dispose();
    _adresseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.1),
            border: Border.all(
              color: Colors.white30,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  Icons.people_outline,
                  size: 30,
                  color: Colors.blue.shade900,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _pseudoController,
                  style: GoogleFonts.comfortaa(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Pseudo',
                    hintStyle: GoogleFonts.comfortaa(
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.1),
            border: Border.all(
              color: Colors.white30,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  Icons.mail_outline,
                  size: 30,
                  color: Colors.blue.shade900,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _emailController,
                  style: GoogleFonts.comfortaa(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Adresse email',
                    hintStyle: GoogleFonts.comfortaa(
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.1),
            border: Border.all(
              color: Colors.white30,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  Icons.abc,
                  size: 30,
                  color: Colors.blue.shade900,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _nomController,
                  style: GoogleFonts.comfortaa(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Nom',
                    hintStyle: GoogleFonts.comfortaa(
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.1),
            border: Border.all(
              color: Colors.white30,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  Icons.abc,
                  size: 30,
                  color: Colors.blue.shade900,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _prenomController,
                  style: GoogleFonts.comfortaa(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Prenom',
                    hintStyle: GoogleFonts.comfortaa(
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.1),
            border: Border.all(
              color: Colors.white30,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  Icons.lock_outline,
                  size: 30,
                  color: Colors.blue.shade900,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _passwordController,
                  style: GoogleFonts.comfortaa(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Mot de passe',
                    hintStyle: GoogleFonts.comfortaa(
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.1),
            border: Border.all(
              color: Colors.white30,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  Icons.add_home,
                  size: 30,
                  color: Colors.blue.shade900,
                ),
              ),
              Expanded(
                child: Autocomplete<Address>(
                  optionsBuilder: (TextEditingValue textEditingValue) async {
                    if (textEditingValue.text.isEmpty) {
                      return const Iterable<Address>.empty();
                    }
                    // Utilisation de fetchAddresses pour obtenir des adresses basées sur la saisie de l'utilisateur
                    return await fetchAddresses(textEditingValue.text);
                  },
                  displayStringForOption: (Address option) => option.label,
                  fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                    return TextField(
                      controller: _adresseController,
                      focusNode: fieldFocusNode,
                      style: GoogleFonts.comfortaa(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Adresse',
                        hintStyle: GoogleFonts.comfortaa(
                          color: Colors.white,
                        ),
                        border: InputBorder.none,
                      ),
                    );
                  },
                  onSelected: (Address selection) {
                    _adresseController.text = selection.label;
                  },
                ),
              ),
              
            ],
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(height: 20),
          ButtonWidget(
            pseudoController: _pseudoController,
            emailController: _emailController,
            passwordController: _passwordController,
            nomController: _nomController,
            prenomController: _prenomController,
            adresseController: _adresseController,
          ),
      ]),
    );
  }

}

class ButtonWidget extends StatelessWidget {
  final TextEditingController pseudoController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nomController;
  final TextEditingController prenomController;
  final TextEditingController adresseController;

  const ButtonWidget({
    super.key,
    required this.pseudoController,
    required this.emailController,
    required this.passwordController,
    required this.nomController,
    required this.prenomController,
    required this.adresseController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        child: Text(
          'Inscription'.toUpperCase(),
          style: TextStyle(
            color: Colors.blue.shade900,
            fontSize: 20,
          ),
        ),
        onPressed: () async {
          final success = await AuthService.signup(
            pseudoController.text,
            passwordController.text,
            emailController.text,
            nomController.text,
            prenomController.text,
            adresseController.text,
          );

          if (success) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Inscription réussie')));
            // Vous pouvez ici naviguer vers une autre page si nécessaire
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur lors de l\'inscription')));
          }
        },
      ),
    );
  }
}