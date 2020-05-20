import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_posts/photo_gallery_screen.dart';

class PostImages extends StatefulWidget {
  final List<String> myImages;

  PostImages(this.myImages);

  @override
  _PostImagesState createState() => _PostImagesState(myImages);
}

class _PostImagesState extends State<PostImages> {
  PageController pageController;
  final List<String> images;

  _PostImagesState(this.images);

  @override
  void initState() {
    super.initState();
    pageController = PageController(
        initialPage: 1, viewportFraction: images.length == 1 ? 0.98 : 0.85);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: images.length,
      controller: pageController,
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: pageController,
          builder: (ctx, widget) {
            double value = 1;
            if (pageController.position.haveDimensions) {
              value = pageController.page - index;
              value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
            }
            return Center(
              child: SizedBox(
                height: Curves.easeInOut.transform(value) * double.infinity,
                width: Curves.easeInOut.transform(value) * double.infinity,
                child: widget,
              ),
            );
          },
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PhotoGalleryScreen(images); //need to use routing
                  },
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
