import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10), // Add some margin around the search box
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Soften the shadow
            spreadRadius: 2, // Extend the shadow
            blurRadius: 5, // Blur the shadow
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _controller, // Use the controller
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        ),
      ),
    );
  }
}
