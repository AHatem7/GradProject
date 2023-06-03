import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class ViewPDF extends StatelessWidget {
  static const String routename='viewpdf';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        PDF().cachedFromUrl(
            'https://firebasestorage.googleapis.com/v0/b/gradprojectfinal-ca1d1.appspot.com/o/test%2Ftask%201%20ui.pdf?alt=media&token=ad4e2a70-24e5-4229-8b05-3dcfea7a248e')
    ,


    );
  }
}
