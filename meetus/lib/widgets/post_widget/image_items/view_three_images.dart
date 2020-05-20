import 'package:flutter/material.dart';
import 'package:schoolbookapp/widgets/post_widget/photo_gallery.dart';

class ViewThreeImages extends StatelessWidget {
  final List<String> images;
  final BoxConstraints constraints;

  ViewThreeImages(this.images, this.constraints);

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
              child: Image.network(
                images[0],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: InkWell(
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
                    margin: EdgeInsets.only(left: 1),
                    child: Image.network(
                      images[1],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Expanded(
                child: InkWell(
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
                    margin: EdgeInsets.only(left: 1),
                    child: Image.network(
                      images[2],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
