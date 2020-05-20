import 'package:flutter/material.dart';
import 'package:schoolbookapp/models/document.dart';
import 'package:schoolbookapp/widgets/post_widget/docs_viewer.dart';

class PostDocs extends StatelessWidget {
  final Document document;

  PostDocs(this.document);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(
          Icons.picture_as_pdf,
          color: Colors.red,
          size: 40,
        ),
        title: Text(
          document.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(document.docUrl),
        onTap: () {
          if (document.docUrl != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DocsViewer(document);
                },
              ),
            );
          }
        },
        dense: true,
        //selected: true,
        trailing: Icon(Icons.check_circle),
      ),
    );
  }
}
