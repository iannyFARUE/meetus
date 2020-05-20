import 'package:flutter/material.dart';
import 'package:schoolbookapp/widgets/post_widget/image_items/view_four_images.dart';
import 'package:schoolbookapp/widgets/post_widget/image_items/view_four_plus_images.dart';
import 'package:schoolbookapp/widgets/post_widget/image_items/view_one_image.dart';
import 'package:schoolbookapp/widgets/post_widget/image_items/view_three_images.dart';
import 'package:schoolbookapp/widgets/post_widget/image_items/view_two_images.dart';

class PostImages extends StatelessWidget {
  final List<String> images;

  PostImages(this.images);

  @override
  Widget build(BuildContext context) {
    final count = images.length;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (count == 1) {
          return ViewOneImage(images, constraints);
        } else if (count == 2) {
          return ViewTwoImages(images, constraints);
        } else if (count == 3) {
          return ViewThreeImages(images, constraints);
        } else if (count == 4) {
          return ViewFourImages(images, constraints);
        } else {
          return ViewFourPlusImages(images, constraints);
        }
      },
    );
  }
}
