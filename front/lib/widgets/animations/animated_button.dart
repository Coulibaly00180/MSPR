import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final IconData iconData;
  final String route;
  final bool isLight;

  const AnimatedButton({
    Key? key,
    required this.text,
    required this.iconData,
    required this.route,
    this.isLight = true,
  }) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapCancel: () => setState(() => _isPressed = false),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
        setState(() => _isPressed = false); // Reset the state when the button is tapped
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        transform: Matrix4.diagonal3Values(_isPressed ? 0.95 : 1.0, _isPressed ? 0.95 : 1.0, 1),
        child: Card(
          color: widget.isLight ? Colors.white : Colors.green.shade400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.iconData,
                  color: widget.isLight ? Colors.green.shade400 : Colors.white,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: widget.isLight ? Colors.green.shade400 : Colors.white,
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
