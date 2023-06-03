import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:untitled2/storage_service.dart';

import 'Departments.dart';

class viewfile extends StatefulWidget {
  viewfile({required this.viewfilename});

  static String routename = 'viewfile';
  late String viewfilename;
  //const viewfile({Key? key}) : super(key: key);

  @override
  State<viewfile> createState() => _viewfileState();
}

class _viewfileState extends State<viewfile> {
  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();

    return Stack(
      children: [


        Scaffold(
          //backgroundColor: Colors.transparent,
          body: FutureBuilder(
              future: storage.downloadURl(widget.viewfilename),
              builder:
                  (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData && widget.viewfilename.endsWith('.pdf')) {
                  return
                  //   Image.network(snapshot.data!,
                  //     fit: BoxFit.cover,
                  //
                  // );


                  SfPdfViewer.network(snapshot.data!);
                }
                 else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/bac.png',
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),



                          Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Stack(
                                 children: [Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),


                                    child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
                    width: 341,
                    height: 351,
                                      child: Center(
                                        child: Container(
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
                                          width:300,
                                          height: 300,
                                          child: Image.network(snapshot.data!,
                                          fit: BoxFit.cover,

                    ),
                                        ),
                                      ),
                                    ),
                                  ),
                                 ],   ),
                              ),
                            ],
                          ),],
                      );


                    // SfPdfViewer.network(snapshot.data!);
                }

                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return Container();
              }),

        )
        ,SizedBox(height: 110,
          child: Row(
            children: [Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
              FloatingActionButton(onPressed: (){
                Navigator.pop(context, MaterialPageRoute(builder: (context)=> Departments()));

              },
                child: Icon(Icons.arrow_back, color: Colors.black,size: 28),
                backgroundColor: Colors.transparent,elevation: 0,)
            ],
          ),
        ),
      ],
    );
  }
}
