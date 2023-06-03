import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:untitled2/USER/profileuser.dart';
import 'package:untitled2/USER/viewFileUser.dart';
import '../storage_service.dart';
import 'chatpageUser.dart';

class UserHomePage extends StatelessWidget {
  static const String routename ='UserHomePage';

  //const UserHomePage({Key? key}) : super(key: key);
  final Storage storage = Storage();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Image.asset('assets/images/BG1.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover),




        Scaffold(


            drawer: Drawer(



              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child:Icon(Icons.security_outlined,size: 50) ,
                    decoration: BoxDecoration(
                      color:  Color.fromRGBO(220,205, 168,1),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.person,color: Colors.black,size: 25,),
                        title: Text('Profile'),
                        onTap: () {
                          // Do something
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePageUser1()));

                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.chat,color: Colors.black,size: 25,),
                        title: Text('Chat'),
                        onTap: () {
                          // Do something
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> chatpageuser(email: '',)));

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

                Expanded(
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // IconButton(
                      //     onPressed: (){
                      //       Navigator.push(context, MaterialPageRoute(builder: (context)=> chatpageuser(email: '',)));
                      //     },
                      //     icon: Icon(Icons.chat,color: Colors.black,size: 50,)),SizedBox(width: 23,),
                      // IconButton(
                      //     onPressed: (){
                      //       Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePageUser1()));
                      //     },
                      //     icon: Icon(Icons.person,color: Colors.black,size: 50,)),SizedBox(width: 23,)

                    ],
                  ),
                ),
                Expanded(child: Row(children: const [],))



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
                ,Center(
                  child:
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(' Files',style:
                        TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15,),


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
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>viewfileUser(viewfilenameuser:snapshot.data!.items[index].name)));



                                      },
                                      child: Text(snapshot.data!.items[index].name,style: TextStyle(color: Colors.black)),style: ElevatedButton.styleFrom(primary: Colors.white),
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
              ],
            )




        ),
        // Row( mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Padding(padding: EdgeInsets.symmetric(horizontal: 140,vertical: 55)),
        //     FloatingActionButton(onPressed: (){
        //       Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadFile()));
        //     },
        //       child: const Icon(Icons.add,color: Colors.white, size: 45,),
        //       backgroundColor: const Color.fromRGBO(220, 205, 168, 1),
        //     ),
        //   ],
        // ),
      ],

    );
  }
}
