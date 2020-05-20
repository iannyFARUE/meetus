import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_posts/docs_viewer_screen.dart';
import 'package:schoolbookapp/app_posts/models/document.dart';
import 'package:schoolbookapp/app_theme.dart';
import 'package:schoolbookapp/utils/hex_color.dart';

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
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
      ),
      child: GestureDetector(
        onTap: () {
          if (document.docUrl != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DocsViewerScreen(document);
                },
              ),
            );
          }
        },
        child: Row(
          children: <Widget>[
            Container(
              height: 20.0,
              width: 20.0,
              margin: EdgeInsets.only(left: 8.0),
              child: FittedBox(
                child: Text(
                  '${document.id} - ',
                  style: AppTheme.subtitle,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.picture_as_pdf,
                color: HexColor('#FF5287'),//.withOpacity(0.5),
                size: 30,
              ),
            ),
            //SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    document.name,
                    style: AppTheme.textTheme.subtitle,
                    overflow: TextOverflow.ellipsis,
                    //softWrap: true,
                    maxLines: 1,
                  ),
                  Text(
                    document.docUrl,
                    style: AppTheme.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ), /*ListTile(
        dense: true,
        //contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0),
        leading: Container(
          child: Icon(
            Icons.picture_as_pdf,
            color: Colors.red,
            size: 30,
          ),
        ),
        title: Text(
          document.name,
          style: AppTheme.textTheme.subtitle,
          overflow: TextOverflow.ellipsis,
          //softWrap: true,
          maxLines: 1,
        ),
        subtitle: Text(
          document.docUrl,

        ),
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

        //selected: true,
        trailing: Icon(
          Icons.check_circle,
          size: 20,
        ),
      ),*/
    );
  }
}
