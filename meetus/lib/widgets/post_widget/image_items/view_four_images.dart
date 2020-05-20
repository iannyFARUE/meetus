import 'package:flutter/material.dart';
import 'package:schoolbookapp/widgets/post_widget/photo_gallery.dart';

class ViewFourImages extends StatelessWidget {
  final List<String> images;
  final BoxConstraints constraints;

  ViewFourImages(this.images, this.constraints);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PhotoGallery(images);
                      },
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: constraints.maxHeight * 0.45,
                  //height: double.infinity,
                  margin: EdgeInsets.all(1), 
                  child: Image.network(
                    images[0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PhotoGallery(images);
                      },
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: constraints.maxHeight * 0.45,
                  margin: EdgeInsets.all(1),
                  child: Image.network(
                    images[1],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PhotoGallery(images);
                      },
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: constraints.maxHeight * 0.45,
                  margin: EdgeInsets.all(1),
                  child: Image.network(
                    images[2],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PhotoGallery(images);
                      },
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: constraints.maxHeight * 0.45,
                  margin: EdgeInsets.all(1),
                  child: Image.network(
                    images[3],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
