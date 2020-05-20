import 'package:flutter/material.dart';
import 'package:schoolbookapp/models/comment.dart';
import 'package:schoolbookapp/models/document.dart';
import 'package:schoolbookapp/models/like.dart';
import 'package:schoolbookapp/models/post.dart';
import 'package:schoolbookapp/models/school.dart';
// import '../model/comments.dart';

class Posts with ChangeNotifier {
  final List<Post> _posts = [
    Post(
      comments: [
        Comment(
          message: "This is perfect",
          date: DateTime.now(),
          id: "1",
          name: "Ian Madhara",
        ),
      ],
      description: "You are all invited to a meeting",
      id: "1",
      title: "General Meeting",
      documents: [
        Document(
          id: "1",
          docUrl:
              "https://file-examples.com/wp-content/uploads/2017/10/file-sample_150kB.pdf",
          name: "agenda",
        ),
      ],
      likes: [
        Like(id: "1", dateLiked: DateTime.now(), name: "Ian Madhara"),
      ],
      images: [
        'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
      ],
      school: School(
        id: "1",
        abbreviation: "MH2",
        name: "Mufakose 2 High",
        location: "Harare Zim",
      ),
      type: Type.PRIVATE,
      dateCreated: DateTime.now().subtract(Duration(days: 2)),
    ),
    Post(
      comments: [
        Comment(
          message: "This is perfect",
          date: DateTime.now(),
          id: "1",
          name: "Ian Madhara",
        ),
      ],
      description: "You are all invited to a meeting",
      id: "1",
      title: "General Meeting",
      documents: [
        Document(
          id: "1",
          docUrl:
              "https://file-examples.com/wp-content/uploads/2017/10/file-sample_150kB.pdf",
          name: "agenda",
        ),
      ],
      likes: [
        Like(id: "1", dateLiked: DateTime.now(), name: "Ian Madhara"),
      ],
      images: [
        'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
      ],
      school: School(
        id: "1",
        abbreviation: "MH2",
        name: "Mufakose 2 High",
        location: "Harare Zim",
      ),
      type: Type.PRIVATE,
      dateCreated: DateTime.now().subtract(Duration(days: 2)),
    ),
    Post(
      comments: [
        Comment(
            message: "This is perfect",
            date: DateTime.now(),
            id: "1",
            name: "Honest Mukumba"),
        Comment(
            message: "This is perfect",
            date: DateTime.now(),
            id: "1",
            name: "Akosha Mukumba"),
        Comment(
            message: "This is perfect",
            date: DateTime.now(),
            id: "1",
            name: "ANashe Mukumba"),
        Comment(
            message: "This is perfect",
            date: DateTime.now(),
            id: "1",
            name: "Honest Mukumba"),
      ],
      description:
          "You are all invited to a meeting You are all invited to a meeting You are all invited to a meeting You are all invited to a meeting You are all invited to a meeting You are all invited to a meeting You are all invited to a meetingYou are all invited to a meeting",
      id: "1",
      title: "General Meeting",
      documents: [
        Document(
          id: "1",
          docUrl:
              "https://file-examples.com/wp-content/uploads/2017/10/file-sample_150kB.pdf",
          name: "agenda",
        ),
      ],
      likes: [
        Like(id: "1", dateLiked: DateTime.now(), name: "Ian Madhara"),
      ],
      images: [
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
      ],
      school: School(
        id: "1",
        abbreviation: "MH2",
        name: "Mufakose 2 High",
        location: "Harare Zim",
      ),
      type: Type.PUBLIC,
      dateCreated: DateTime.now().subtract(Duration(days: 2)),
    ),
    Post(
      comments: [
        Comment(
            message: "This is perfect",
            date: DateTime.now(),
            id: "1",
            name: "Ian Madhara"),
      ],
      description: "You are all invited to a meeting",
      id: "1",
      title: "General Meeting",
      documents: [
        Document(
          id: "1",
          docUrl:
              "https://file-examples.com/wp-content/uploads/2017/10/file-sample_150kB.pdf",
          name: "agenda",
        ),
      ],
      likes: [
        Like(id: "1", dateLiked: DateTime.now(), name: "Ian Madhara"),
      ],
      images: [
        'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
        'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
      ],
      school: School(
        id: "1",
        abbreviation: "MH2",
        name: "Mufakose 2 High",
        location: "Harare Zim",
      ),
      type: Type.PRIVATE,
      dateCreated: DateTime.now().subtract(Duration(days: 2)),
    ),
    Post(
      comments: [
        Comment(
          message: "This is perfect",
          date: DateTime.now(),
          id: "1",
          name: "Ian Madhara",
        ),
      ],
      description: "You are all invited to a meeting",
      id: "1",
      title: "General Meeting",
      documents: [
        Document(
          id: "1",
          docUrl:
              "https://file-examples.com/wp-content/uploads/2017/10/file-sample_150kB.pdf",
          name: "agenda",
        ),
      ],
      likes: [
        Like(id: "1", dateLiked: DateTime.now(), name: "Ian Madhara"),
      ],
      images: [
        'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
        'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
      ],
      school: School(
        id: "1",
        abbreviation: "MH2",
        name: "Mufakose 2 High",
        location: "Harare Zim",
      ),
      type: Type.PRIVATE,
      dateCreated: DateTime.now().subtract(Duration(days: 2)),
    ),
    Post(
      comments: [
        Comment(
          message: "This is perfect",
          date: DateTime.now(),
          id: "1",
          name: "Ian Madhara",
        ),
      ],
      description: "You are all invited to a meeting",
      id: "1",
      title: "General Meeting",
      documents: [
        /*Document(
          id: "1",
          docUrl:
              "https://file-examples.com/wp-content/uploads/2017/10/file-sample_150kB.pdf",
          name: "agenda",
        ), */
      ],
      likes: [
        Like(id: "1", dateLiked: DateTime.now(), name: "Ian Madhara"),
      ],
      images: [
        'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
        'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
      ],
      school: School(
        id: "1",
        abbreviation: "MH2",
        name: "Mufakose 2 High",
        location: "Harare Zim",
      ),
      type: Type.PRIVATE,
      dateCreated: DateTime.now().subtract(Duration(days: 2)),
    )
  ];

  List<Post> get items {
    return [..._posts];
  }

  void addPost() {
    // _posts.add(Post());
    notifyListeners();
  }
}
