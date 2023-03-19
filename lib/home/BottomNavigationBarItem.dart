import 'package:flutter/material.dart';
import 'package:untitled2/CardDesign.dart';
import 'package:untitled2/home/HomePage.dart';
import 'package:untitled2/home/ProfilePage.dart';
import 'package:untitled2/home/RequestPage.dart';
import 'package:untitled2/home/UsersPage.dart';
import 'package:untitled2/backgrounds.dart';


class DirectoryPage extends StatefulWidget {
static const String routename = 'mainpage';

  @override
  State<DirectoryPage> createState() => _DirectoryPageState();
}

class _DirectoryPageState extends State<DirectoryPage> {
int currentindex =0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Background('assets/images/bk.jpg'),
      Scaffold(resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Theme(data: Theme.of(context).copyWith(
            canvasColor: Colors.white,shadowColor: Colors.transparent
        ),
          child: BottomNavigationBar(currentIndex: currentindex,
              onTap: (index){
                currentindex=index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/home.png')),
                    label: 'homepage',),

                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/user.png')),
                    label: 'users'),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/r.png')),
                    label: 'request'),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/pr.png')),
                    label: 'profile'),
              ]),
        ),
        body:taps[currentindex]


      ),
    ],);
  }
  List<Widget> taps =[HomePage(),UsersPage(),RequestPage(),ProfilePage()];
}
