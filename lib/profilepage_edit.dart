import 'package:flutter/material.dart';
import 'package:untitled2/home/ProfilePage.dart';
import 'backgrounds.dart';
import 'dataprofile.dart';

class Profile_Edit extends StatelessWidget {

  static const String routename ='profile edit';

  const Profile_Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [ Background('assets/images/bac.png'),


        Column(

        children: [const Spacer(),
          Expanded(
            child:
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),),
                FloatingActionButton(onPressed: (){
                  Navigator.pop(context, MaterialPageRoute(builder: (context)=> ProfilePage()));
                  },
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.arrow_back,size: 35,color: Colors.black),),
              ],
            ),),
          Expanded(flex: 3,
            child:
            Row(
              children: [ const Padding(padding: EdgeInsets.all(20)),
                const CircleAvatar(foregroundColor: Colors.white,child: Icon(Icons.person_rounded,size: 70)  ,maxRadius: 60,backgroundColor: Colors.blueGrey,),
                const SizedBox(width: 20,),
                Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Admin',style: Theme.of(context).textTheme.headline1,),
                    Text('89663',style: Theme.of(context).textTheme.titleLarge,),

                  ],
                ),
              ],
            ),),
          const SizedBox(height:25 ,),
          Expanded(
            child: Row(
              children:[const Padding(padding: EdgeInsets.only(left: 25)),const Icon(Icons.email_outlined),
                DataProfile(label: 'E-Mail', content: '89663@abc.org.eg'),
               // IconButton(onPressed: (){}, icon:Icon(Icons.edit)),
              ],),),
          const Divider(
            color: Colors.black12,
            height: 20,
            thickness: 1.2,indent: 75,endIndent: 30
          ),
          Row(
            children: [const Padding(padding: EdgeInsets.only(left: 25)),const Icon(Icons.email),
              DataProfile(label: 'Personal E-Mail', content: 'Admin@gmail.com'),
              Container(
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: MaterialButton(onPressed: (){},
                  child: Container(child: const Icon(Icons.edit)),

                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
            thickness: 1.2,indent: 75,endIndent: 30,
          ),
          Stack(
            children: [
              Row(
                children: [const Padding(padding: EdgeInsets.only(left: 25)),const Icon(Icons.phone),
                  DataProfile(label: 'Phone Number', content: '0111111002'),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: MaterialButton(onPressed: (){},
                      child: const Icon(Icons.edit),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            color: Colors.black12,
            height: 20,
            thickness: 1.2,indent: 75,endIndent: 30),
          Row(
            children: [const Padding(padding: EdgeInsets.only(left: 25)),const Icon(Icons.lock),
              DataProfile(label: 'Password', content:'********'),
            ],
          ),const Divider(
            color: Colors.black12,
            height: 20,
            thickness: 1.2,indent: 75,endIndent: 30,


          ),
          Row(
            children: [const Padding(
                padding: EdgeInsets.only(left: 25)),const Icon(Icons.desktop_mac),
              DataProfile(label: 'Department', content: 'Flutter Developer'),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: MaterialButton(onPressed: (){},
                  child: const Icon(Icons.edit),

                ),
              ),
            ],
          ),const Divider(
            color: Colors.black12,
            height: 20,
            thickness: 1.2,indent: 75,endIndent: 30,


          ),
          Expanded(
            child: Row(
              children: const [],
            ),
          ),const Spacer()



        ],),
      ],);
  }
}
