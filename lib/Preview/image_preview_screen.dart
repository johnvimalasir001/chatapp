import 'dart:io';

import 'package:chatrat/Global/globals.dart';
import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';

class ImageViewPage extends StatefulWidget {
  final ImageProviderCategory imageProviderCategory;
  final String imagePath;

  ImageViewPage(
      {Key? key, required this.imageProviderCategory, required this.imagePath})
      : super(key: key);

  @override
  _ImageViewPageState createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: PhotoView(
            imageProvider: _getParticularImage(),
            enableRotation: true,
            initialScale: null,
            loadingBuilder: (context, event) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorBuilder: (context, obj, stackTrace) => const Center(
                child: Text(
              'Image not Found',
              style: TextStyle(
                fontSize: 23.0,
                color: Colors.red,
                fontFamily: 'Lora',
                letterSpacing: 1.0,
              ),
            )),
          ),
        ),
      ),
    );
  }

  _getParticularImage() {
    switch (widget.imageProviderCategory) {
      case ImageProviderCategory.FileImage:
        return FileImage(File(widget.imagePath));

      case ImageProviderCategory.ExactAssetImage:
        return ExactAssetImage(widget.imagePath);

      case ImageProviderCategory.NetworkImage:
        return NetworkImage(widget.imagePath);
    }
  }
}
