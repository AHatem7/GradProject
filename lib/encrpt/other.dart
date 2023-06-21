import 'package:flutter/material.dart';

class DownloadPage extends StatelessWidget {
  static const String routeName = 'download';

  @override
  Widget build(BuildContext context) {
    final String uploadedFileUrl =
    ModalRoute.of(context)!.settings.arguments as String;

    // Use the uploadedFileUrl to build the UI of the page

    return Scaffold(body: Text(uploadedFileUrl),

    );
  }
}

//
// class ListPage extends StatelessWidget {
//   static const String routeName = 'list';
//
//   final List<String> uploadedFileUrls;
//
//   const ListPage({Key? key, required this.uploadedFileUrls}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Uploaded Files'),
//       ),
//       body: ListView.builder(
//         itemCount: uploadedFileUrls.length,
//         itemBuilder: (BuildContext context, int index) {
//           final String uploadedFileUrl = uploadedFileUrls[index];
//           return ListTile(
//             title: Text(uploadedFileUrl),
//             onTap: () {
//               Navigator.pushNamed(
//                 context,
//                 DownloadPage.routeName,
//                 arguments: uploadedFileUrl,
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }