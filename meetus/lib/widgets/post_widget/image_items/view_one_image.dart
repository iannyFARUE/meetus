import 'package:flutter/material.dart';
import 'package:schoolbookapp/widgets/post_widget/photo_gallery.dart';

class ViewOneImage extends StatelessWidget {
  final List<String> images;
  final BoxConstraints constraints;

  ViewOneImage(this.images, this.constraints);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return PhotoGallery(images);
            },
          ));
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          //width: MediaQuery.of(context).size.width * 0.9,
          //width: double.infinity,
          child: Image.network(
            images[0],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
