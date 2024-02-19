import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front/route.dart';



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
      content: Text('Welcome to the App!', textAlign: TextAlign.center),
      duration: Duration(seconds: 2),
      backgroundColor: Theme.of(context).primaryColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/images/logo.png", width: 150),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 3,
                mainAxisSpacing: 0,
                crossAxisCount: 2,
                children: <Widget>[
                  _buildButton(context, "MON PROFIL", FontAwesomeIcons.user, "/profil"),
                  _buildButton(context, "MES ANNONCES", FontAwesomeIcons.pagelines, "/annoncesMenu/mesAnnonces"),
                  _buildButton(context, "MES AROSA-JE", FontAwesomeIcons.droplet, "/arosa-je"),
                  _buildButton(context, "CONSEILS", FontAwesomeIcons.book, "/catalog"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, IconData iconData, String route) {
    final isButtonPressed = _isPressed[route] ?? false; // Default to not pressed

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed[route] = true),
      onTapCancel: () => setState(() => _isPressed[route] = false),
      onTapUp: (_) => setState(() => _isPressed[route] = false),
      onTap: () {
        Navigator.of(context).pushNamed(route);
        setState(() => _isPressed[route] = false); // Reset the state when the button is tapped
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        transform: Matrix4.diagonal3Values(isButtonPressed ? 0.95 : 1.0, isButtonPressed ? 0.95 : 1.0, 1),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 8),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}