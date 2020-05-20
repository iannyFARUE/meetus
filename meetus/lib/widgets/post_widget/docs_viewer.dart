import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:schoolbookapp/models/document.dart';

class DocsViewer extends StatefulWidget {
  final Document documents;

  DocsViewer(this.documents);
  @override
  _DocsViewerState createState() => _DocsViewerState();
}

class _DocsViewerState extends State<DocsViewer> {
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
        appBar: AppBar(
          title: Text("${widget.documents.name}"),
        ),
        body: Center(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : PDFViewer(document: document)));
  }
}
