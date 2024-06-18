// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static final ImagePicker _picker = ImagePicker();

  static Future<XFile?> pickImageFromGallery({required BuildContext context}) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final CroppedFile? croppedFile = await getCroppedImage(pickedFile,context);
      if (croppedFile != null) {
        return XFile(croppedFile.path);
      }
    }
    return pickedFile;
  }

  static Future<XFile?> captureImageFromCamera({required BuildContext context}) async {
    final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera, maxHeight: 480, maxWidth: 640);
    if (pickedFile != null) {
      final CroppedFile? croppedFile = await getCroppedImage(pickedFile,context);
      if (croppedFile != null) {
        return XFile(croppedFile.path);
      }
    }
    return pickedFile;
  }

  static Future<CroppedFile?> getCroppedImage(XFile imageFile,BuildContext context) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Theme.of(context).colorScheme.onPrimary,
              toolbarWidgetColor: Theme.of(context).colorScheme.onSurface,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
      return croppedFile;
    } catch (e) {
      return null;
    }
  }
}
