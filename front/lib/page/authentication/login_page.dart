import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Login",
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoIcon(),
              TitleSection(),
              TextSection(),
              InputSection(),
              ButtonWidget(),
              BottomSection(),
              ForgetButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class LogoIcon extends StatelessWidget {
  const LogoIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.all(30),
      height: 250,
      width: 250,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.1),
        borderRadius: BorderRadius.circular(70),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 15,
              offset: const Offset(0, 3),
            )
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'ARosaje',
            style: GoogleFonts.exo(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: Colors.lightGreenAccent.shade400,
            ),
          ),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50, top: 5),
      child: Text(
        'Page de connexion Flutter',
        style: GoogleFonts.comfortaa(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class InputSection extends StatelessWidget {
  const InputSection({super.key});

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
                  Icons.lock_outline,
                  size: 30,
                  color: Colors.blue.shade900,
                ),
              ),
              Expanded(
                child: TextField(
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
      ]),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

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
          'Connexion'.toUpperCase(),
          style: TextStyle(
            color: Colors.blue.shade900,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignupPage(),
            ),
          );
        },
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Pas encore de compte ?',
            style: GoogleFonts.comfortaa(color: Colors.white),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupPage(),
                  ),
                );
              },
              child: Text(
                'Inscrivez-vous',
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

class ForgetButton extends StatelessWidget {
  const ForgetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: TextButton(
        child: Text(
          'Mot de passe oublié',
          style: GoogleFonts.comfortaa(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
