import 'dart:typed_data';

import 'package:multi_image_picker/multi_image_picker.dart';

class PictureEntity{
  String id;
  Uint8List uint8;
  Asset asset;

  PictureEntity({
    this.id,
    this.uint8,
    this.asset
  });
}