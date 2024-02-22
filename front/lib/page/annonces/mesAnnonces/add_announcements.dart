import 'dart:io';
import 'package:flutter/material.dart';
import '../../../constant/css.dart';
import '../../../widgets/date_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';


class AddAnnouncementPage extends StatefulWidget {
  const AddAnnouncementPage({Key? key}) : super(key: key);

  @override
  _AddAnnouncementPageState createState() => _AddAnnouncementPageState();
}

class _AddAnnouncementPageState extends State<AddAnnouncementPage> {
  XFile? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImage(ImageSource source) async {
  final pickedFile = await _picker.pickImage(source: source);
  if (pickedFile != null) {
    setState(() {
      _selectedImage = pickedFile;
    });
  }
}


  void _showImagePickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text('Veuillez choisir une source'),
          content: Container(
            height: MediaQuery.of(context).size.height / 6,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _getImage(ImageSource.gallery);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.image),
                      Text('Depuis la galerie'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _getImage(ImageSource.camera);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.camera),
                      Text('Depuis la caméra'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Déposer une annonce'),
        backgroundColor: greenBar,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background image with opacity
          Opacity(
            opacity: 0.5,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/feuilles.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const Text(
                            'Mon annonce',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: TextButton.icon(
                                  icon: const Icon(Icons.camera_alt),
                                  label: const Text('Choisir une photo'),
                                  onPressed: _showImagePickerDialog,
                                  style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Couleur du texte du bouton
                                    backgroundColor: MaterialStateProperty.all<Color>(greenBar), // Couleur de fond du bouton
                                  ),
                                ),
                              ),
                              if (_selectedImage != null)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    File(_selectedImage!.path),
                                    fit: BoxFit.cover,
                                    width: 272,
                                    height: 300,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Date de début de garde', style: TextStyle(color: Colors.grey)),
                          const DatePicker(),
                          const SizedBox(height: 10),
                          const Text('Date de fin de garde', style: TextStyle(color: Colors.grey)),
                          const DatePicker(),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // TODO: Implement les fonctions pour ajouter l'annonce
                            },
                            child: const Text('Ajouter mon annonce'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green.shade400,
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
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
