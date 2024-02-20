import 'package:flutter/material.dart';
import '../../../widgets/appbar/bottom_appbar_menu.dart';
import '../../../widgets/date_picker.dart';

class AddAnnouncementPage extends StatelessWidget {
  const AddAnnouncementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Déposer une annonce'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                color: Colors.grey[900],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const Text(
                        'Mon annonce',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              style: TextStyle(color: Colors.white), // Text style
                              decoration: InputDecoration(
                                labelText: 'Photo de ma plante',
                                labelStyle: TextStyle(color: Colors.grey), // Label style
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[400]!),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.camera_alt, color: Colors.grey),
                            onPressed: () {
                              // TODO: Implement image capture/upload functionality
                            },
                          ),
                        ],
                      ),
                      // const SizedBox(height: 10),
                      // _buildTextField(labelText: 'Nom de ma plante'),
                      const SizedBox(height: 10),
                      const Text('Date de début de garde', style: TextStyle(color: Colors.grey)),
                      const DatePicker(),
                      //const DatePicker(onDateSelected: (DateTime ) { },),
                      const SizedBox(height: 10),
                      const Text('Date de fin de garde', style: TextStyle(color: Colors.grey)),
                      const DatePicker(),
                      //const DatePicker(onDateSelected: (DateTime ) {  },),
                      TextFormField(
                        style: TextStyle(color: Colors.white), // Text style
                        decoration: InputDecoration(
                          labelText: 'Rechercher ma plante dans le catalogue',
                          labelStyle: TextStyle(color: Colors.grey), // Label style
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search, color: Colors.grey),
                            onPressed: () {
                              // TODO: fonction of search button
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[400]!),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Implement les fonctions pour ajouter l'annonce
                        },
                        child: const Text('Ajouter mon annonce'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          onPrimary: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBarMenu(),
    );
  }

  TextFormField _buildTextField({required String labelText}) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
      ),
    );
  }
}
