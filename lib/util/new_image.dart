import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class NewImagePickerWidget extends StatefulWidget {
  final ValueChanged<File> onValueChanged;
  final ValueChanged<String> onValueChangedUrl;
  final String edit;

  const NewImagePickerWidget({
    Key? key,
    required this.onValueChanged,
    required this.onValueChangedUrl,
    required this.edit,
  }) : super(key: key);

  @override
  State<NewImagePickerWidget> createState() => _NewImagePickerWidgetState();
}

class _NewImagePickerWidgetState extends State<NewImagePickerWidget> {
  File? _image;
  late String _imageUrl =
      'https://thumbs.dreamstime.com/b/image-edit-tool-outline-icon-image-edit-tool-outline-icon-linear-style-sign-mobile-concept-web-design-photo-gallery-135346318.jpg';

  @override
  void initState() {
    super.initState();
    // Check if there is already an image associated with the current user
    _checkUserImage();
  }

  Future<void> _checkUserImage() async {
    // Logic to check for an existing image locally, if necessary.
    // You can implement this as per your requirements.
  }

  Future<void> getImage(ImageSource source) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imagePermanent = await saveFilePermanently(image.path);

      setState(() {
        _image = imagePermanent;
      });

      widget.onValueChanged(_image!);
      
      setState(() {
        _imageUrl = _image!.path;
      });
      widget.onValueChangedUrl(_image!.path);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 0,
              ),
              _image != null
                  ? Image.file(
                      _image!,
                      width: 230,
                      height: 210,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      _imageUrl,
                      width: 230,
                      height: 210,
                      fit: BoxFit.cover,
                    ),
              const SizedBox(
                height: 20,
              ),
              customButton(
                title: 'Escolher da galeria',
                icon: Icons.image_outlined,
                onClick: () => getImage(ImageSource.gallery),
              ),
              const SizedBox(
                height: 5,
              ),
              customButton(
                title: 'Tirar uma foto',
                icon: Icons.camera_alt,
                onClick: () => getImage(ImageSource.camera),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget customButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return SizedBox(
    width: 220,
    child: ElevatedButton(
      onPressed: onClick,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 5),
          Text(title, style: const TextStyle(fontSize: 14)),
        ],
      ),
    ),
  );
}
