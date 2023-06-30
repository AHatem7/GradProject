import 'package:flutter/material.dart';
import 'package:untitled2/USER/chatpageUser.dart';
import 'package:untitled2/USER/profileuser.dart';
import 'package:untitled2/home/FinalDecryption.dart';
import '../backgrounds.dart';
//import '../home/decryptionPage.dart';
import '../home/chatHelper.dart';
import 'homePage.dart';

class UserNavBar extends StatefulWidget {
  static const routename = 'Navigation';
  //const UserNavBar({super.key});

  @override
  State<UserNavBar> createState() => _UserNavBarState();
}

class _UserNavBarState extends State<UserNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background('assets/images/BG1.png'),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Theme(data: Theme.of(context).copyWith(
              canvasColor: Colors.white, shadowColor: Colors.transparent),
              child: BottomNavigationBar(
                  currentIndex: currentIndex,
                  onTap: (index){
                    currentIndex = index;
                    setState(() {

                    });
                  },

                  items: [
                    BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/home.png')),
                      label: 'HomePage',),
                    BottomNavigationBarItem(icon: Icon(Icons.chat_outlined),
                        label: 'Chat'),
                    BottomNavigationBarItem(icon: Icon(Icons.lock_open_outlined),
                        label: 'Decryption'),
                    BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),
                        label: 'Profile'),
                  ]
              )
          ),
          body: tabs[currentIndex],
        )
      ],
    );
  }
  List<Widget> tabs = [UserHomePage(),UsersListPage(),decryptionPage(),ProfilePageUser1()];
}