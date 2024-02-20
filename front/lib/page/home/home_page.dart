import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front/route.dart';

import '../../widgets/animations/animated_button.dart';



class NavigationUltime extends StatefulWidget {
  const NavigationUltime({Key? key}) : super(key: key);

  @override
  State<NavigationUltime> createState() => _NavigationUltimeState();
}

class _NavigationUltimeState extends State<NavigationUltime> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      onGenerateRoute: (RouteSettings settings) {
        for (var path in navigationPaths) {
          if (settings.name == path.pathName) {
            return MaterialPageRoute(
              builder: (context) => path.builder(context, settings),
              settings: settings,
            );
          }
        }
        // Si aucune correspondance n'est trouvée, retournez null ou une route par défaut.
        return MaterialPageRoute(builder: (context) => Scaffold());
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Track the pressed state of each button
  Map<String, bool> _isPressed = {};

  @override
  void initState() {
    super.initState();
    // Schedule the welcome message to show after the build method is complete
    WidgetsBinding.instance.addPostFrameCallback((_) => _showWelcomeMessage());
  }

  void _showWelcomeMessage() {
    final snackBar = SnackBar(
      content: const Text('Welcome to the App!', textAlign: TextAlign.center),
      duration: Duration(seconds: 2),
      backgroundColor: Theme.of(context).primaryColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/homeImg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Image.asset("assets/images/logo.png", width: 150),
                Expanded(
                  child: Center(
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 0,
                      crossAxisCount: 2,
                      children: <Widget>[
                        AnimatedButton(text: "MON PROFIL", iconData: FontAwesomeIcons.user, route: "/profil", isLight: true),
                        AnimatedButton(text: "MES ANNONCES", iconData: FontAwesomeIcons.pagelines, route: "/annoncesMenu", isLight: false),
                        AnimatedButton(text: "MES AROSA-JE", iconData: FontAwesomeIcons.droplet, route: "/arosa-je", isLight: false),
                        AnimatedButton(text: "CONSEILS", iconData: FontAwesomeIcons.book, route: "/catalog", isLight: true),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


// Widget _buildButton(BuildContext context, String text, IconData iconData, String route, bool isLight) {
  //   final isButtonPressed = _isPressed[route] ?? false; // Default to not pressed
  //
  //   return GestureDetector(
  //     onTapDown: (_) => setState(() => _isPressed[route] = true),
  //     onTapCancel: () => setState(() => _isPressed[route] = false),
  //     onTapUp: (_) => setState(() => _isPressed[route] = false),
  //     onTap: () {
  //       Navigator.of(context).pushNamed(route);
  //       setState(() => _isPressed[route] = false); // Reset the state when the button is tapped
  //     },
  //     child: AnimatedContainer(
  //       duration: const Duration(milliseconds: 100),
  //       curve: Curves.easeInOut,
  //       transform: Matrix4.diagonal3Values(isButtonPressed ? 0.95 : 1.0, isButtonPressed ? 0.95 : 1.0, 1),
  //       child: Card(
  //         color: isLight ? Colors.white : Colors.green.shade400,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(15),
  //         ),
  //         child: Center(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Icon(
  //                 iconData,
  //                 color: isLight ? Colors.green.shade400 : Colors.white,
  //               ),
  //               const SizedBox(height: 8),
  //               Text(
  //                 text,
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                   color: isLight ? Colors.green.shade400 : Colors.white,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}