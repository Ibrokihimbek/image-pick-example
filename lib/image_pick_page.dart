import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> productImages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImagePicker'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              selectImages();
            },
            child: Text('Select Images'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productImages.length,
              itemBuilder: (BuildContext conext, int index) {
                return SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.file(
                    File(productImages[index].path),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void selectImages() async {
    final List<XFile> selectedImages = await _picker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      productImages.addAll(selectedImages);
    }
    setState(() {});
  }
}
