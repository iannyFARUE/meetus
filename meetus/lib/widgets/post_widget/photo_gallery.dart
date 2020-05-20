import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoGallery extends StatelessWidget {
  final List<String> images;

  PhotoGallery(this.images);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Gallery"),
      ),
      body: PhotoViewGallery.builder(
        itemCount: images.length,
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(images[index]),
            initialScale: PhotoViewComputedScale.contained * 0.8,
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        scrollPhysics: BouncingScrollPhysics(),
        backgroundDecoration:
            BoxDecoration(color: Theme.of(context).canvasColor),
        loadingBuilder: (context, progress) => Center(
          child: Container(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
                //  value: _progress == null
                //      ? null
                //      : _progress.cumulativeBytesLoaded /
                //          _progress.expectedTotalBytes,
                ),
          ),
        ),
      ),
    );
  }
}
