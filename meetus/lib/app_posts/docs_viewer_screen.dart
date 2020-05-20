import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:schoolbookapp/app_posts/models/document.dart';
import 'package:schoolbookapp/app_posts/widgets/posts_app_bar.dart';
import 'package:schoolbookapp/app_theme.dart';

class DocsViewerScreen extends StatefulWidget {
  static final routeName = "/post-docs-view-screen";
  final Document documents;

  DocsViewerScreen(this.documents);
  @override
  _DocsViewerScreenState createState() => _DocsViewerScreenState();
}

class _DocsViewerScreenState extends State<DocsViewerScreen> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    try {
      document = await PDFDocument.fromURL(widget.documents.docUrl);

      setState(() => _isLoading = false);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: <Widget>[
            PostsAppBar('${widget.documents.name}'),
            Expanded(
              child: Container(
                color: AppTheme.background,
                child: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : PDFViewer(document: document),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
