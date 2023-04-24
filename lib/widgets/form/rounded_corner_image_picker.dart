import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RoundedCornerImagePicker extends StatefulWidget {
  final void Function(File) onImagePicked;
  final ImageProvider? image;

  const RoundedCornerImagePicker(
      {Key? key, required this.onImagePicked, this.image})
      : super(key: key);

  @override
  State<RoundedCornerImagePicker> createState() =>
      _RoundedCornerImagePickerState();
}

class _RoundedCornerImagePickerState extends State<RoundedCornerImagePicker> {
  final ImagePicker picker = ImagePicker();

  File? _imageFile;

  Future<void> pickImage(BuildContext context, ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      _imageFile = pickedFile != null ? File(pickedFile.path) : null;
    });

    widget.onImagePicked(_imageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Dialog d = Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a photo from the camera'),
                onTap: () {
                  pickImage(context, ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Pick from the gallery'),
                onTap: () {
                  pickImage(context, ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return d;
          },
        );
      },
      child: Container(
        height: 300.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          border: Border.all(color: Colors.grey),
          image: _imageFile == null
              ? (widget.image == null
                  ? null
                  : DecorationImage(image: widget.image!, fit: BoxFit.cover))
              : DecorationImage(
                  image: FileImage(_imageFile!), fit: BoxFit.cover),
        ),
        child: _imageFile == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Tap to select a photo',
                      style: TextStyle(color: Colors.grey)),
                  SizedBox(
                    height: 16.0,
                  ),
                  Icon(
                    Icons.camera_alt,
                    size: 64.0,
                    color: Colors.grey,
                  ),
                ],
              )
            : Image.file(
                _imageFile!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
