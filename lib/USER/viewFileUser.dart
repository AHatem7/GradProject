import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:untitled2/USER/homePage.dart';
import 'package:untitled2/storage_service.dart';



class viewfileUser extends StatefulWidget {
  viewfileUser({required this.viewfilenameuser});

  static String routename = 'viewfileuser';
  late String viewfilenameuser;
  //const viewfile({Key? key}) : super(key: key);

  @override
  State<viewfileUser> createState() => _viewfileUserState();
}

class _viewfileUserState extends State<viewfileUser> {
  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();

    return Stack(
      children: [
        Image.asset(
          'assets/images/bac.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 25)),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                    FloatingActionButton(onPressed: (){
                      //  Navigator to the previous page
                      Navigator.pop(context, MaterialPageRoute(builder: (context)=> UserHomePage()));
                    },
                      child:Icon(Icons.arrow_back, color: Colors.black,size: 35),
                      backgroundColor: Colors.white,
                    )
                  ],
                ),

                SizedBox(
                  height: 50,
                ),

                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child:
                  Container(
                    width: 341,
                    height: 341,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
                    child: Column(
                      children: [
                        FutureBuilder(
                            future: storage.downloadURl(widget.viewfilenameuser),
                            builder:
                                (BuildContext context, AsyncSnapshot<String> snapshot) {
                              if (snapshot.connectionState == ConnectionState.done &&
                                  snapshot.hasData) {
                                return Center(
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
                                    width: 300,
                                    height: 300,
                                    child: Image.network(snapshot.data!,
                                      fit: BoxFit.cover,

                                    ),
                                  ),
                                );
                              }
                              if (snapshot.connectionState == ConnectionState.waiting ||
                                  !snapshot.hasData) {
                                return CircularProgressIndicator();
                              }
                              return Container();
                            }),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 250,),

                // ElevatedButton(
                //   style:ElevatedButton.styleFrom(fixedSize: Size(300,50),
                //       primary: Color.fromRGBO(220, 205, 168, 1),
                //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18),
                //       )),
                //   onPressed: () {
                //
                //     //Navigator.push(context, MaterialPageRoute(builder: (context)=> Departments()));
                //   },
                //   child:Text('View',style: TextStyle(
                //       fontSize: 18
                //   ),
                //   ),
                // ),
              ],
            ),
          ),

        )
      ],
    );
  }
}