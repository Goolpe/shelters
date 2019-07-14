import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'package:shelters/shelf.dart';

class PhotoGallerySh extends StatelessWidget {
  const PhotoGallerySh({
    Key key, 
    this.index,
    this.itemCount
  }) : super(key:key);

  final int index;
  final int itemCount;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Container(
            width: 50,
            child: InkWell(
              child: Icon(Icons.close, color: Colors.white, size: 24),
              onTap: () => Navigator.pop(context),
            ),
          )
        ],
        backgroundColor: Colors.black,
      ),
      body: PhotoViewGallery.builder(
        pageController: PageController(initialPage: index),
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int i) {
          return PhotoViewGalleryPageOptions(
            imageProvider: CachedNetworkImageProvider(
              URL
            ),
            initialScale: PhotoViewComputedScale.contained * 0.8,
            minScale: PhotoViewComputedScale.contained * 1,
            maxScale: PhotoViewComputedScale.contained * 5,
            heroTag: 'photo$i',
          );
        },
        itemCount: itemCount,
      )
    );
  }
}
