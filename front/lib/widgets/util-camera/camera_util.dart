import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CameraUtil {
  final ImagePicker _picker = ImagePicker();

  Future<File?> getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      final Directory appDir = await getApplicationDocumentsDirectory();
      final String imagePath = '${appDir.path}/my_image.jpg';
      final File newImage = File(pickedFile.path);
      final File savedImage = await newImage.copy(imagePath);
      return savedImage;
    }
    return null;
  }
}
