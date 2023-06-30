import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/home/HomePage.dart';
import 'package:untitled2/home/ProfilePage.dart';
import 'package:untitled2/uplode_file.dart';
import 'package:untitled2/view_file.dart';
import 'CardDesign.dart';
import 'backgrounds.dart';
import 'drop_bottom.dart';
import 'package:untitled2/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'encrpt/decryptPage.dart';
import 'encrpt/test.dart';
import 'home/chatHelper.dart';
import 'home/chatTest.dart';



class Departments extends StatefulWidget {
static const String routename ='departments';

  const Departments({Key? key}) : super(key: key);

  @override
  State<Departments> createState() => _DepartmentsState();
}

class _DepartmentsState extends State<Departments> {
  @override
  Widget build(BuildContext context) {

    final Storage storage = Storage();
    var url ;

    final firebase_storage.FirebaseStorage storage1 =
        firebase_storage.FirebaseStorage.instance;


    return
      Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Background('assets/images/BG1.png'),






        Scaffold(

            drawer: Drawer(



              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(color: Colors.red,
                        image: DecorationImage(image: AssetImage('assets/images/img.png'),
                            fit: BoxFit.cover)

                    ),

                    child:Text(''),
                    // Icon(Icons.security_outlined,size: 50) ,
                    // decoration: BoxDecoration(
                    //   color:  Color.fromRGBO(220,205, 168,1),
                    // ),
                  ),
                  Column(
                    children: <Widget>[
                      ListTile(
                        leading: ImageIcon(AssetImage('assets/images/pr.png')),
                        title: Text('Profile'),
                        onTap: () {
                          // Do something
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage()));

                        },
                      ),
                      ListTile(
                        leading: ImageIcon(AssetImage('assets/images/request.png')),
                        title: Text('Chat'),
                        onTap: () {
                          // Do something
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>UsersListPage() ));

                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.black,size: 30),leadingWidth: 100,
                elevation: 0,
                backgroundColor: Colors.transparent,
                actions: [
                ]),
            backgroundColor: Colors.transparent,


            body:
            Column(
              children: [
                Expanded( flex:2,

                    child: Row(children: const [],)),
                // Expanded(
                //   child: Row(
                //     children: [const Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
                //       FloatingActionButton(onPressed: (){
                //         Navigator.pop(context, MaterialPageRoute(builder: (context)=> const HomePage()));
                //       },
                //         child: const Icon(Icons.arrow_back,color: Colors.black,size: 35),
                //         backgroundColor: Colors.white,
                //       )
                //     ],
                //   ),
                // ),
                Center(
                  child:
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(' Files',style:
                        TextStyle(fontWeight: FontWeight.w400,fontSize: 25,color: Colors.black87),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15,),

                // const DropDownButton(),

                // Expanded( flex: 9,
                //   child: GridView.count(
                //     padding: const EdgeInsets.all(30),
                //     crossAxisCount: 2,mainAxisSpacing: 20,crossAxisSpacing: 10,
                //     children: [
                //       // CardDesign(height: 90, width: 100, radius: 40,
                //       //     cardimage: 'assets/images/WhiteBG.png'),
                //       // CardDesign(height: 90, width: 100, radius: 40,
                //       //     cardimage: 'assets/images/WhiteBG.png'),
                //       // CardDesign(height: 90, width: 100, radius: 40,
                //       //     cardimage: 'assets/images/WhiteBG.png'),
                //       // CardDesign(height: 90, width: 100, radius: 40,
                //       //     cardimage: 'assets/images/WhiteBG.png'),
                //       // CardDesign(height: 90, width: 100, radius: 40,
                //       //     cardimage: 'assets/images/WhiteBG.png'),
                //       // CardDesign(height: 90, width: 100, radius: 40,
                //       //     cardimage: 'assets/images/WhiteBG.png'),
                //       // CardDesign(height: 90, width: 100, radius: 40,
                //       //     cardimage: 'assets/images/WhiteBG.png'),
                //       // CardDesign(height: 90, width: 100, radius: 40,
                //       //     cardimage: 'assets/images/WhiteBG.png'),
                //       // CardDesign(height: 90, width: 100, radius: 40,
                //       //     cardimage: 'assets/images/WhiteBG.png'),
                //     ],
                //   ),
                // ),

    Expanded(flex: 12,
      child: FutureBuilder(
          future: storage.listFiles(),

          builder: (BuildContext context,
              AsyncSnapshot<firebase_storage.ListResult> snapshot) {
            if(snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData){
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                child: GridView.builder(
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.items.length,
                    itemBuilder: (BuildContext context, int index){
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: ElevatedButton(
                          onPressed: ()  async {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                viewfile(viewfilename:snapshot.data!.items[index].name)));



//   final ref = FirebaseStorage.instance.ref().child(snapshot.data!.items[index].name);
// // no need of the file extension, the name will do fine.
//    url = await ref.getDownloadURL();
//   print(url);

                          },
                        child:
                        Stack(alignment: Alignment.center,
                          children: [

                            Opacity(opacity: 0.03,child: Image.asset('assets/images/open-file.png'),),
                            Text(snapshot.data!.items[index].name,
                              style: TextStyle(color: Colors.black,fontSize: 10)),




                          ], ),
                         style: ElevatedButton.styleFrom(primary: Colors.white,


                         elevation: 6,shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.only(
                                     bottomLeft: Radius.circular(20),topRight: Radius.circular(20))),

                         ),


                    ),



                     );


                    }),
              );
            }
            if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
              return CircularProgressIndicator();
            }
            return Container();
          }),
    ),

                // FutureBuilder(
                //
                //     future: storage.downloadURl('IMG-20230517-WA0004.jpg'),
                //     builder: (BuildContext context,
                //         AsyncSnapshot<String> snapshot) {
                //       if(snapshot.connectionState == ConnectionState.done &&
                //           snapshot.hasData){
                //         return Container(
                //           width: 300,
                //           height: 250,
                //           child: Image.network(
                //               snapshot.data!,
                //               fit: BoxFit.cover),
                //         );
                //
                //       }
                //       if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
                //         return CircularProgressIndicator();
                //       }
                //       return Container();
                //     }),


              ],
            )




        ),
        Row( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.symmetric(horizontal: 140,vertical: 55)),
            FloatingActionButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> EncryptionPage()));
            },
              child: const Icon(Icons.add,color: Colors.white, size: 45,),
              backgroundColor: const Color.fromRGBO(220, 205, 168, 1),
            ),
            // FloatingActionButton(onPressed: (){
            //   Navigator.push(context, MaterialPageRoute(builder: (context)=> UsersListPage()));
            // },
            //   child: const Icon(Icons.abc,color: Colors.white, size: 45,),
            //   backgroundColor: const Color.fromRGBO(220, 205, 168, 1),
            // ),
          ],
        ),
      ],

    );
  }
}
