
import 'dart:typed_data';

import 'package:multi_image_picker/multi_image_picker.dart';

class PictureModel{
  String id;
  Uint8List uint8;
  Asset asset;

  PictureModel({
    this.id,
    this.uint8,
    this.asset
  });
}