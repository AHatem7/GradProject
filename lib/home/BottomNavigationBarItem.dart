
import 'package:flutter/material.dart';
import 'package:untitled2/Departments.dart';
import 'package:untitled2/home/HomePage.dart';
import 'package:untitled2/home/ProfilePage.dart';
import 'package:untitled2/home/chatpage.dart';
import 'package:untitled2/home/UsersPage.dart';
import 'package:untitled2/backgrounds.dart';


class DirectoryPage extends StatefulWidget {
static const String routename = 'mainpage';

  const DirectoryPage({Key? key}) : super(key: key);

  @override
  State<DirectoryPage> createState() => _DirectoryPageState();
}

class _DirectoryPageState extends State<DirectoryPage> {
int currentindex =0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
     Background('assets/images/BG1.png'),



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
              items: const [
                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/home.png')),
                    label: 'Homepage',),

                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/user.png')),
                    label: 'Users'),
                // BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/r.png')),
                //     label: 'request'),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/request.png')),
                    label: 'Chat'),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/pr.png')),
                    label: 'Profile'),
              ]),
        ),
        body:taps[currentindex]


      ),
    ],);
  }
  List<Widget> taps =[
    const Departments(),
    UsersPage(),
    chatpage(email: '',),
     ProfilePage()];
}
