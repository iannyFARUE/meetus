import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:schoolbookapp/app_posts/widgets/posts_app_bar.dart';

class PhotoGalleryScreen extends StatelessWidget {
  static final routeName = "/post-photo-gallery-screen";
  final List<String> images;

  PhotoGalleryScreen(this.images);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            children: <Widget>[
              PostsAppBar('Image Gallery'),
              Expanded(
                child: PhotoViewGallery.builder(
                  itemCount: images.length,
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: NetworkImage(images[index]),
                      initialScale: PhotoViewComputedScale.contained,
                      minScale: PhotoViewComputedScale.contained * 0.8,
                      maxScale: PhotoViewComputedScale.covered * 2,
                    );
                  },
                  scrollPhysics: BouncingScrollPhysics(),
                  enableRotation: true,
                  backgroundDecoration: BoxDecoration(
                    color: Colors.black87,
                  ),
                  loadingBuilder: (context, event) => Center(
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        value: event == null
                            ? null
                            : event.cumulativeBytesLoaded /
                                event.expectedTotalBytes,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
