import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/CardDesign.dart';
import 'package:untitled2/dataprofile.dart';
import 'package:untitled2/home/profilepage_edit.dart';
import 'package:untitled2/main.dart';

class ProfilePage extends StatelessWidget {
static const String routename ='profile page';

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [Spacer(),
        Expanded(
        child: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile_Edit()));
          },
              icon: Icon(Icons.edit,size: 35)),
            Padding(
                padding: EdgeInsets.only(right: 25),)


          ],
        ),
      ),
        Expanded(flex: 3,
           child: Row(
             children: [ Padding(padding: EdgeInsets.all(20)),

            CircleAvatar(foregroundColor: Colors.white,child: Icon(Icons.person_rounded,size: 70)  ,maxRadius: 60,backgroundColor: Colors.blueGrey,),
             SizedBox(width: 20,), 
               Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Admin',style: Theme.of(context).textTheme.headline1,),
              Text('89663',style: Theme.of(context).textTheme.titleLarge,),

            ],
          ),
        ],

      ),
         ),SizedBox(height:25 ,),
       Row(
         children: [Padding(padding: EdgeInsets.only(left: 25)),Icon(Icons.email_outlined),
           DataProfile(label: 'E-Mail', content: '89663@abc.org.eg'),
         ],
       ),Divider(
          color: Colors.black12,
          height: 20,
          thickness: 1.2,indent: 75,endIndent: 30,


        ),
        Row(
          children: [Padding(padding: EdgeInsets.only(left: 25)),Icon(Icons.email),
            DataProfile(label: 'Personal E-Mail', content: 'Admin@gmail.com'),
          ],
        ),Divider(
          color: Colors.black12,
          height: 20,
          thickness: 1.2,indent: 75,endIndent: 30,


        ),
        Row(
        children: [Padding(padding: EdgeInsets.only(left: 25)),Icon(Icons.phone),
          DataProfile(label: 'Phone Number', content: '0111111002'),
        ],
      ),Divider(
          color: Colors.black12,
          height: 20,
          thickness: 1.2,indent: 75,endIndent: 30,


        ),
        Row(
         children: [Padding(padding: EdgeInsets.only(left: 25)),Icon(Icons.lock),
           DataProfile(label: 'Password', content:'********'),
         ],
       ),Divider(
          color: Colors.black12,
          height: 20,
          thickness: 1.2,indent: 75,endIndent: 30,


        ),
       Row(
         children: [Padding(
             padding: EdgeInsets.only(left: 25)),Icon(Icons.desktop_mac),
           DataProfile(label: 'Department', content: 'Flutter Developer'),
         ],
       ),Divider(
          color: Colors.black12,
          height: 20,
          thickness: 1.2,indent: 75,endIndent: 30,


        ),
        Expanded(
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));

              }, child: Text('Logout',
                style: TextStyle(
                    color: Colors.red,fontSize: 25,
                    fontWeight: FontWeight.bold),)),
            ],
          ),
        ),Spacer()



    ],);
  }
}