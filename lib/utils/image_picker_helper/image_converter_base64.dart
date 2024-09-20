import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

class ImageConverterBase64 {
  static imageConvertBase(String path) {
    File file = File(path);
    final bytes = file.readAsBytesSync();
    return base64Encode(bytes);
  }

  static assetImageBase(String path) async {
    ByteData bytes = await rootBundle.load(path);
    var buffer = bytes.buffer;
    var m = base64.encode(Uint8List.view(buffer));
    return m;
  }
}
