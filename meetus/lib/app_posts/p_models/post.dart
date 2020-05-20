import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_posts/models/comment.dart';
import 'package:schoolbookapp/app_posts/models/document.dart';
import 'package:schoolbookapp/app_posts/models/like.dart';
import 'package:schoolbookapp/app_posts/models/school.dart';


enum Type {
  PRIVATE,
  PUBLIC,
}

class Post with ChangeNotifier {
  final String id;
  final School school;
  final List<String> images;
  final List<Document> documents;
  final List<Like> likes;
  final String title;
  final String description;
  final List<Comment> comments;
  final Type type;
  final DateTime dateCreated;
  bool isLiked = false;

  Post({
    this.id,
    this.school,
    this.comments,
    this.description,
    this.documents,
    this.likes,
    this.images,
    this.title,
    this.type,
    this.dateCreated,
  });

  void toggleFavourite() {
    isLiked = !isLiked;
    notifyListeners();
  }

  Icon get types {
    switch (this.type) {
      case Type.PRIVATE:
        return Icon(
          Icons.lock,
          size: 15.0,
          color: Colors.grey,
        );
        break;
      case Type.PUBLIC:
        return Icon(
          Icons.public,
          size: 15.0,
          color: Colors.grey,
        );
        break;
      default:
        return Icon(
          Icons.public,
          size: 15.0,
          color: Colors.grey,
        );
    }
  }
}
