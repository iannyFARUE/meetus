import 'package:flutter/material.dart';
import 'package:schoolbookapp/widgets/post_widget/photo_gallery.dart';

class ViewTwoImages extends StatelessWidget {
  final List<String> images;
  final BoxConstraints constraints;

  ViewTwoImages(this.images, this.constraints);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return PhotoGallery(images);
                },
              ));
            },
            child: Container(
              padding: EdgeInsets.only(right: 1),
              width: MediaQuery.of(context).size.width * 0.45,
              height: double.infinity,
              child: Container(
                child: Image.network(
                  images[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return PhotoGallery(images);
                },
              ));
            },
            child: Container(
              padding: EdgeInsets.only(left: 1),
              width: MediaQuery.of(context).size.width * 0.45,
              height: double.infinity,
              child: Image.network(
                images[1],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
